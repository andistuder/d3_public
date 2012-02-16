Given /^the seeded news items$/ do
  25.times do
    FactoryGirl.create :news_item
  end
end
When /^I should see all twenty more items$/ do
  page.has_css?('.news_item', :count => 25)
end