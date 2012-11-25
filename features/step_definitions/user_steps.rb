### UTILITY METHODS ###

def create_visitor
  @visitor ||= {
    first_name: "Testy",
    last_name: "McUserton",
    login: "mctesty",
    email: "example@example.com",
    password: "please",
    password_confirmation: "please" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email],
                                    login: @visitor[:login])
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "First name", :with => @visitor[:first_name]
  fill_in "Last name", :with => @visitor[:last_name]
  fill_in "Login", :with => @visitor[:login]
  fill_in "Email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "Password confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in login_type = :email
  visit '/users/sign_in'
  fill_in "Login or email", :with => @visitor[login_type]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with (email|login) and password$/ do |login_type|
  create_visitor
  sign_in login_type.to_sym
end

When /^I sign in ussing (.*)$/ do |provider|
  provider =
    case provider
    when "google"
      "google_oauth2"
    when "twitter"
      "twitter"
    end
  visit user_omniauth_authorize_path(provider)
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a (.*)$/ do |field_to_empty|
  create_visitor
  field_to_empty = field_to_empty.parameterize('_').to_sym
  @visitor = @visitor.merge(field_to_empty => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "please123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "First name", :with => "newname"
  fill_in "Current password", :with => @visitor[:password]
  click_button "Save changes"
end

When /^I look at the list of users$/ do
  visit '/'
end

When /^I upload my avatar$/ do
  click_link "Edit account"
  attach_file "Avatar", Rails.root.join('spec', 'fixtures', 'avatar.jpg')
  click_button "Save changes"
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I see a successful authentication message\.$/ do
  page.should have_content "Successfully authenticated"
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "A message with a confirmation link has been sent to your email address."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing (.*) message$/ do |field|
  field.capitalize!
  page.should have_content "#{field} can't be blank"
end

Then /^I should see a mismatched password confirmation message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end

Then /^I see my new avatar$/ do
  expect(page).to have_selector("img.avatar")
end

