module SuscriptionSteps
  def new_channel
    @new_channel ||= {
      feed_url: 'www.coolfeed.com/feed.rss',
      feed_title: 'Cool Feed'
    }
  end

  def feed_title
    new_channel[:feed_title]
  end
end

World(SuscriptionSteps)

### WHEN ###

When /^I add a suscription to a new channel\.$/ do
  visit new_suscription_path
  fill_in "Feed url", with: new_channel[:feed_url]
  click_button "Suscribe"
end

Then /^I see a successful suscribed to channel message\.$/ do
  expect(page).to have_content("You have successfully suscripted to #{feed_title}")
end

Then /^I see this channel posts\.$/ do
  pending
  expect(page).to have_content(feed_title)
end

