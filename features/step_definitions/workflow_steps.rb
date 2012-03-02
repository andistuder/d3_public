Given /^the following workflow items:$/ do |table|
  @wfi = []
  @wfi = table.hashes
end

When /^I add those workflow items to the CMS$/ do

  @wfi.each_with_index do |n, i|
    visit('/admin')
    click_link "Workflow items"
    click_link "Add new"
    fill_in "workflow_item_title", :with => @wfi[i][:title]
    fill_in "workflow_item_list_title", :with => @wfi[i][:list_title]
    fill_in "workflow_item_overlay", :with => @wfi[i][:overlay]
    fill_in "workflow_item_list_area", :with => @wfi[i][:list_area]
    fill_in "workflow_item_content_area", :with => @wfi[i][:content_area]
    click_button "Save"
  end

end
