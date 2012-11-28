Feature: comment articles
  In order keep opinions
  A user
  Should make Comments on Articles

  Background: A user is signed in and is suscribed to a channel.
      Given I am logged in
        And I am suscribed to a channel

    @vcr
    Scenario: Adding a comment
       When I add a comment to an article.
       Then I see a successful posted comment message.
        And I see my comment last.

