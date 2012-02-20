Given /^the following project categories:$/ do |table|
  @project_cats = []
  @project_cats = table.hashes
end

Given /^the following projects:$/ do |table|
  @projects = []
  @projects = table.hashes
end

When /^I add those projects to the CMS$/ do

  @projects.each_with_index do |n, i|
    visit('/admin')
    click_link "Projects"
    click_link "Add new"
    fill_in "project_name", :with => @projects[i][:name]
    fill_in "project_slug", :with => @projects[i][:slug]
    fill_in "project_summary", :with => @projects[i][:summary]
    fill_in "project_concept", :with => @projects[i][:concept]
    fill_in "project_how_made", :with => @projects[i][:how_made]
    #fill_in "project_sort_order", :with => i
    #within("#project_category_asset_ids_field") do
    #  click_link "Choose all"
    #end
    click_button "Save"
  end

  @project_cats.each_with_index do |n, i|
    visit('/admin')
    click_link "Project categories"
    click_link "Add new"
    fill_in "project_category_name", :with => @project_cats[i][:name]
    fill_in "project_category_slug", :with => @project_cats[i][:slug]
    fill_in "project_category_summary", :with => @project_cats[i][:summary]
    fill_in "project_category_content", :with => @project_cats[i][:content]
    within("#project_category_project_ids_field") do
      click_link "Choose all"
    end
    #within("#project_category_asset_ids_field") do
    #  click_link "Choose all"
    #end
    click_button "Save"
  end
end
