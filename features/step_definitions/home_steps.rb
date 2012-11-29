module HomeSteps

end

World(HomeSteps)

### GIVEN ###

Given /^The system is already working$/ do
  step 'I am suscribed to a channel'
end

Given /^I visit the site$/ do
  visit '/'
end

### WHEN ###

When /^I make a search of "(.*?)"$/ do |search_terms|
  fill_in "search", with: search_terms
  click_button "submit"
end

### THEN ###

Then /^I see the channel "(.*?)"$/ do |channel_title|
  expect(page).to have_content(channel_title)
end

