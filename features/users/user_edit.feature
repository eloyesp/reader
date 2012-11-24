Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username and other details

    Background: The usser is logged in
      Given I am logged in

    Scenario: I sign in and edit my account
      When I edit my account details
      Then I should see an account edited message

    Scenario: I can upload an avatar
      When I upload my avatar
      Then I should see an account edited message
       And I see my new avatar

#  - Avatar uploading
#    - Cropping to 400x400, 200x200, 100x100
#  - Profile type
#    - basic - 10 channels
#    - medium - 20 channels
#    - premium - 100 channels

