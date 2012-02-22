Given /^the following partner categories:$/ do |table|
  @partner_cats = []
  @partner_cats = table.hashes
end

Given /^the following partners:$/ do |table|
  @partners = []
  @partners = table.hashes
end

Given /^the following partner content areas:$/ do |table|
  @partner_cas = []
  @partner_cas = table.hashes
end

When /^I add those partners to the CMS$/ do

  create_placeholder_image

  @partner_cas.each_with_index do |n, i|
    visit('/admin')
    click_link "Partner content areas"
    click_link "Add new"
    fill_in "partner_content_area_title", :with => @partner_cas[i][:title]
    fill_in "partner_content_area_content", :with => @partner_cas[i][:content]
    click_button "Save"
  end

  @partners.each_with_index do |n, i|
    visit('/admin')
    click_link "Partners"
    click_link "Add new"
    fill_in "partner_name", :with => @partners[i][:name]
    fill_in "partner_slug", :with => @partners[i][:slug]
    fill_in "partner_summary", :with => @partners[i][:summary]
    fill_in "partner_email", :with => @partners[i][:email]
    fill_in "partner_town", :with => @partners[i][:town]
    fill_in "partner_website", :with => @partners[i][:website]
    within("#partner_partner_content_area_ids_field") do
      click_link "Choose all"
    end
    within("#partner_asset_ids_field") do
      click_link "Choose all"
    end
    click_button "Save"
  end

  @partner_cats.each_with_index do |n, i|
    visit('/admin')
    click_link "Partner categories"
    click_link "Add new"
    fill_in "partner_category_name", :with => @partner_cats[i][:name]
    fill_in "partner_category_slug", :with => @partner_cats[i][:slug]
    fill_in "partner_category_content", :with => @partner_cats[i][:content]
    within("#partner_category_partner_ids_field") do
      click_link "Choose all"
    end
    click_button "Save"
  end
end
