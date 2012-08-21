Given /^the following form data:$/ do |table|
  @form_data = []
  @form_data = table.hashes
end

Given /^the following enquiry page content:$/ do |table|
  @page_data = []
  @page_data = table.hashes
end


When /^I add this page to the CMS$/ do

  @page_data.each_with_index do |n, i|
    visit('/admin/page/new')
    #within(".sidebar-nav") do
    #  click_link "Static pages"
    #end
    #click_link "Add new"
    fill_in "page_name", :with => @page_data[i][:name]
    fill_in "page_slug", :with => @page_data[i][:slug]
    fill_in "page_introduction", :with => @page_data[i][:content]
    click_button "Save"
  end
end


When /^I add those features to the enquiry form$/ do
  pending #the enquiry form can now edited in CMS.. no longer is tested with cucumber.
  @form_data.each_with_index do |n, i|
    visit('/enquiry-form')
    fill_in "first_name", :with => @form_data[i][:first_name]
    fill_in "last_name", :with => @form_data[i][:last_name]
    fill_in "email", :with => @form_data[i][:email]
    fill_in "company", :with => @form_data[i][:company]
    fill_in "city", :with => @form_data[i][:city]
    fill_in "phone1", :with => @form_data[i][:phone1]
    click_button "Submit"
  end
end