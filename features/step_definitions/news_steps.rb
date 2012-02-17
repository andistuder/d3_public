Given /^the seeded news items$/ do
  25.times do
    FactoryGirl.create :news_item
  end
end

When /^I should see twenty more items$/ do
  page.has_css?('.news_item', :count => 22)
end

When /^I should see all twenty five items$/ do
  page.has_css?('.news_item', :count => 25)
end


Given /^the following news items:$/ do |n|
  @news = []
  @news = n.hashes
end

When /^I added those news items to the CMS$/ do

  visit('/admin')
  click_link "Assets"
  click_link "Add new"
  fill_in "asset_name", :with => "Placeholder asset"
  fill_in "asset_description", :with => "Place holder asset desc"
  #attach_file "asset_asset", "#{Rails.root}/features/assets/placeholder246x154.png"
  click_button "Save"

  @news.each_with_index do |n, i|
    visit('/admin')
    click_link "News items"
    click_link "Add new"
    fill_in "news_item_headline", :with => @news[i][:headline]
    #fill_in "news_item_summary", :with => @news[i][:summary]
    fill_in "news_item_content", :with => @news[i][:content]
    within("#news_item_asset_ids_field") do
      click_link "Choose all"
    end
    click_button "Save"
  end

end