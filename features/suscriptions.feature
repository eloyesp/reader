Feature: Suscriptions
  In order to manage suscriptions
  A user
  Should manege suscriptons

  Background: A user is signed in.
      Given I am logged in

    @vcr
    Scenario: Adding a suscription
       When I add a suscription to a new channel.
       Then I see a successful suscribed to channel message.
        And I see this channel posts.

