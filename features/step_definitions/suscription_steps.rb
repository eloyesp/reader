module SuscriptionSteps
  def new_channel
    @new_channel ||= {
      feed_url: 'http://www.feedforall.com/sample.xml',
      feed_title: 'FeedForAll Sample Feed'
    }
  end

  def feed_title
    new_channel[:feed_title]
  end

  def sample_post
    "RSS Solutions for Restaurants"
  end
end

World(SuscriptionSteps)

### GIVEN ###

Given /^I am suscribed to a channel$/ do
  visit new_suscription_path
  fill_in "Feed url", with: new_channel[:feed_url]
  click_button "Suscribe"
end

### WHEN ###

When /^I add a suscription to a new channel\.$/ do
  visit new_suscription_path
  fill_in "Feed url", with: new_channel[:feed_url]
  click_button "Suscribe"
end

### THEN ###

Then /^I see a successful suscribed to channel message\.$/ do
  expect(page).to have_content("You have successfully suscripted to #{feed_title}")
end

Then /^I see this channel posts\.$/ do
  expect(page).to have_content(sample_post)
end

