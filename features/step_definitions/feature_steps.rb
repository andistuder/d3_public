Given /^the following feature categories:$/ do |table|
  @feature_cats = []
  @feature_cats = table.hashes
end

Given /^the following features:$/ do |table|
  @features = []
  @features = table.hashes
end


When /^I add those features to the CMS$/ do

  create_placeholder_image

  @features.each_with_index do |n, i|
    visit('/admin')
    click_link "Features"
    click_link "Add new"
    fill_in "feature_name", :with => @features[i][:name]
    fill_in "feature_slug", :with => @features[i][:slug]
    fill_in "feature_content", :with => @features[i][:content]
    fill_in "feature_sort_order", :with => i
    #within("#feature_category_asset_ids_field") do
    #  click_link "Choose all"
    #end
    click_button "Save"
  end

  @feature_cats.each_with_index do |n, i|
    visit('/admin')
    click_link "Feature categories"
    click_link "Add new"
    fill_in "feature_category_name", :with => @feature_cats[i][:name]
    fill_in "feature_category_slug", :with => @feature_cats[i][:slug]
    fill_in "feature_category_content", :with => @feature_cats[i][:content]
    within("#feature_category_feature_ids_field") do
      click_link "Choose all"
    end
    within("#feature_category_asset_ids_field") do
      click_link "Choose all"
    end
    click_button "Save"
  end
end
