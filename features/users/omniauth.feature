@omniauth
Feature: OmniAuth
  In order to remember less passwords
  A user
  Should be able to sign ussing oauth2

    Scenario: A user sign up ussing google
      Given I do not exist as a user
       When I sign in ussing google
       Then I see a successful authentication message.
        And I should be signed in

    Scenario: A user sign up ussing twitter
      Given I do not exist as a user
       When I sign in ussing twitter
       Then I see a successful authentication message.
        And I should be signed in

