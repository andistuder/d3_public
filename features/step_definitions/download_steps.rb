Given /^the following download categories:$/ do |table|
  @dlcs = []
  @dlcs = table.hashes
end

Given /^the following download items:$/ do |table|
  @dls = []
  @dls = table.hashes
end


Given /^the seeded 25 download items$/ do
  25.times do
    FactoryGirl.create :download
  end
end

When /^I should see ten more download items$/ do
  page.has_css?('.download_items', :count => 20)
end

When /^I should see all twenty five download items$/ do
  page.has_css?('.download_items', :count => 25)
end

When /^I added those download items to the CMS$/ do


  @dlcs.each_with_index do |n, i|
    visit('/admin')
    click_link "Download categories"
    click_link "Add new"
    fill_in "download_category_name", :with => @dlcs[i][:name]
    click_button "Save"
  end

  @dls.each_with_index do |n, i|
    visit('/admin')
    click_link "Downloads"
    click_link "Add new"
    fill_in "download_name", :with => @dls[i][:name]
    fill_in "download_content", :with => @dls[i][:content]
    within("#download_category_ids_field") do
      click_link "Choose all"
    end
    click_button "Save"
  end

end



