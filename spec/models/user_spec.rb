require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      first_name: 'Johny',
      last_name: 'Tester',
      login: 'TestUser',
      email: "user@example.com",
      password: "foobar",
      password_confirmation: "foobar"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require many attributes" do
    [:email, :first_name, :last_name, :login].each do |attribute|
      invalid_user = User.new(@attr.merge(attribute => ""))
      invalid_user.should_not be_valid
    end
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

  describe "avatar" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "can upload an avatar" do
      @user.update_attributes avatar: fixture_file('avatar.jpg')
      expect(@user.avatar.url).to match(/system.*avatar.jpg/)
    end

  end

  describe 'profile' do

    before(:each) do
      @basic_profile = FactoryGirl.create :profile
      @other_profile = FactoryGirl.create :profile, name: 'other'
      @user = User.create!(@attr)
    end

    it "can be changed" do
      @user.profile = @other_profile
      expect(@user.profile).to be(@other_profile)
    end

    it "is protected" do
      expect {
        @user.update_attributes profile: @other_profile
      }.to raise_exception(ActiveModel::MassAssignmentSecurity::Error)
      expect(@user.profile).to eq(@basic_profile)
    end

    it "defaults to basic" do
      expect(@user.profile).to eq(@basic_profile)
    end

  end

  describe 'starred_articles' do

    it 'can mark articles as starred' do
      @user = create :user
      expect(@user.starred_articles).to be_empty
      @article = create(:article)
      @user.starred_articles << @article
      expect(@user.starred_articles).to include(@article)
    end

  end
end

