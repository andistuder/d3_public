Given /^the following case studies:$/ do |table|
  @case_studies = []
  @case_studies = table.hashes
end

When /^I add those case studies to the CMS$/ do

  create_placeholder_image

  @case_studies.each_with_index do |n, i|
    visit('/admin')
    click_link "Case studies"
    click_link "Add new"
    fill_in "case_study_name", :with => @case_studies[i][:name]
    fill_in "case_study_slug", :with => @case_studies[i][:slug]
    fill_in "case_study_case_study_category_name", :with => @case_studies[i][:case_study_category_name]
    fill_in "case_study_summary", :with => @case_studies[i][:summary]
    fill_in "case_study_introduction", :with => @case_studies[i][:introduction]
    fill_in "case_study_content", :with => @case_studies[i][:content]
    fill_in "case_study_sidebar", :with => @case_studies[i][:sidebar]
    within("#case_study_asset_ids_field") do
      click_link "Choose all"
    end
    click_button "Save"
  end

end
