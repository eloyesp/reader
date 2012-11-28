Feature: Star articles
  In order bookmark articles
  A user
  Should mark Articles with a star

  Background: A user is signed in and is suscribed to a channel.
      Given I am logged in
        And I am suscribed to a channel

    @vcr
    Scenario: Starring an article
      Given I am on an article
       When I mark it with a star.
       Then I see a successful starred message.
        And I see the star.

