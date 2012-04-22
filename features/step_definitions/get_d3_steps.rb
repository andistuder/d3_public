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
    visit('/admin/partner_content_area')
    #within(".sidebar-nav") do
    #  click_link "Get d3 content areas"
    #end
    click_link "Add new"
    fill_in "partner_content_area_title", :with => @partner_cas[i][:title]
    fill_in "partner_content_area_content", :with => @partner_cas[i][:content]
    click_button "Save"
  end

  @partners.each_with_index do |n, i|
    visit('/admin/partner')
    #within(".sidebar-nav") do
    #   click_link "Get d3 items"
    #end
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
    visit('/admin/partner_category')
    #within(".sidebar-nav") do
    #  click_link "Get d3 categories"
    #end
    click_link "Add new"
    fill_in "partner_category_name", :with => @partner_cats[i][:name]
    fill_in "partner_category_slug", :with => @partner_cats[i][:slug]
    fill_in "partner_category_content", :with => @partner_cats[i][:content]
    fill_in "partner_category_see_more_label", :with => @partner_cats[i][:see_more_label]
    within("#partner_category_partner_ids_field") do
      click_link "Choose all"
    end
    click_button "Save"
  end
end
