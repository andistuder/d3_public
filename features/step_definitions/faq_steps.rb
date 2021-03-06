When /^the following faq categories$/ do |table|
  @faq_categories = []
  @faq_categories = table.hashes

end

When /^the following faqs$/ do |table|
  @faqs = []
  @faqs = table.hashes
end

When /^I added those faqs to the CMS$/ do

  @faq_categories.each_with_index do |n, i|
    visit('/admin/faq_category')
    #within(".sidebar-nav") do
    #  click_link "Faq categories"
    #end
    click_link "Add new"
    fill_in "faq_category_name", :with => @faq_categories[i][:name]

    click_button "Save"
  end


  @faqs.each_with_index do |n, i|
    visit('/admin/faq')
    #within(".sidebar-nav li[@data-mode='faq'") do
    #  click_link "Faqs"
    #end
    click_link "Add new"
    fill_in "faq_question", :with => @faqs[i][:question]
    fill_in "faq_answer", :with => @faqs[i][:answer]

    #exclude the first faq from cats
    within("#faq_category_ids_field") do
      click_link "Choose all"
    end

    click_button "Save"
  end

end

Then /^I should see those faqs$/ do
  @faqs.each_with_index do |n, i|
    page.has_content? @faqs[i][:question]
  end
end
Then /^I should see faqs for that category$/ do
  page.has_no_content? @faqs[0][:question]
  page.has_content? @faqs[1][:question]
end