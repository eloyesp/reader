module ArticleSteps
  # mock an article to ease testing
  def article
    @article ||= FactoryGirl.create(:article)
  end

  def new_comment
    @new_comment ||= {
      title: "a brave new comment",
      comment:  "This is a sample comment"
    }
  end
end

World(ArticleSteps)

### GIVEN ###


### WHEN ###

When /^I add a comment to an article\.$/ do
  visit article_path(article)

  within("form#new_comment") do
    fill_in "Title", with: new_comment[:title]
    fill_in "Comment", with: new_comment[:comment]
    click_button "Create Comment"
  end
end

### THEN ###

Then /^I see a successful posted comment message\.$/ do
  expect(page).to have_content('Comment was successfully created.')
end

Then /^I see my comment last\.$/ do
  expect(page).to have_content(new_comment[:title])
  expect(page).to have_content(new_comment[:comment])
end

