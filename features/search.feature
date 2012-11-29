Feature: Search articles and channels
  In order to find something interesting to read.
  As a user
  I want to make a full text search

  Background: A user is signed in.
      Given I am logged in
        And The system is already working

    @vcr
    Scenario: Making a full text search
      Given I visit the site
       When I make a search of "industries"
       Then I see the channel "FeedForAll Sample Feed"

