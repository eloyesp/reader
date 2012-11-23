class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :authentication_keys => [:login_or_email]

  attr_accessor :login_or_email

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :login, :email, :password,
                  :password_confirmation, :remember_me, :login_or_email,
                  :provider, :uid

  validates :login, :presence => true, :uniqueness => true
  validates :first_name, :last_name, :presence => true

  # help login with login or email
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login_or_email = conditions.delete(:login_or_email)
      where(conditions).where(["lower(login) = :value OR lower(email) = :value",
        { :value => login_or_email.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create!(
        first_name: data["name"],
        last_name:  data["name"],
        login:      data["email"],
        email:      data["email"],
        password:   Devise.friendly_token[0,20]
      )
      user.confirm!
    end

    user
  end

  def self.find_for_twitter(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:login => data["nickname"]).first

    unless user
      user = User.create!(
        first_name: data["name"],
        last_name:  data["name"],
        login:      data["nickname"],
        email:      data["nickname"] + "@twitter.com",
        password:   Devise.friendly_token[0,20]
      )
      user.confirm!
    end

    user
  end

end
