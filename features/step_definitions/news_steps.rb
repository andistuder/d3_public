Given /^the seeded 25 news items$/ do
  @cat = FactoryGirl.create :category, :name => 'General'
  25.times do
    FactoryGirl.create :news_item, :categories => [@cat]
  end
  end

Given /^the seeded 25 announcement items$/ do
  @cat = FactoryGirl.create :category, :name => 'Product updates'
  25.times do
    FactoryGirl.create :news_item, :categories => [@cat]
  end
end

When /^I should see ten more items$/ do
  page.has_css?('.news_item', :count => 20)
end

When /^I should see all twenty five items$/ do
  page.has_css?('.news_item', :count => 25)
end


Given /^the following news items:$/ do |n|
  @news = []
  @news = n.hashes
end


Given /the seeded the category (.+)$/ do |cat_name|
  FactoryGirl.create :category, :name => cat_name
end
#Given /the seeded the category 'General'/ do
#  FactoryGirl.create :category, :name => 'General'
#end

When /^I added those news items to the CMS$/ do

  create_placeholder_image

  @news.each_with_index do |n, i|
    visit('/admin')
    within(".sidebar-nav") do
      click_link "News items"
    end
    click_link "Add new"
    fill_in "news_item_headline", :with => @news[i][:headline]
    #fill_in "news_item_summary", :with => @news[i][:summary]
    fill_in "news_item_content", :with => @news[i][:content]
    within("#news_item_asset_ids_field") do
      click_link "Choose all"
    end
    within("#news_item_category_ids_field") do
      click_link "Choose all"
    end
    click_button "Save"
  end

end



def create_placeholder_image
  visit('/admin/asset/new')
  within(".sidebar-nav") do
    click_link "Assets"
  end

  click_link "Add new"
  fill_in "asset_name", :with => "Placeholder asset"
  fill_in "asset_description", :with => "Place holder asset desc"
  #attach_file "asset_asset", "#{Rails.root}/features/assets/placeholder246x154.png"
  click_button "Save"

end