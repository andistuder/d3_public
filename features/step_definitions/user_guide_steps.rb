When /^the following parent chapters$/ do |table|
  @parent_chapters = []
  @parent_chapters = table.hashes
end

When /^the following child chapters$/ do |table|
  @child_chapters = []
  @child_chapters = table.hashes
end

When /^the following content_areas$/ do |table|
  @content_areas = []
  @content_areas = table.hashes
end

When /^I added those content areas to the CMS$/ do
  @content_areas.each_with_index do |n, i|
    visit('/admin')

    click_link "Content areas"
    click_link "Add new"
    fill_in "content_area_name", :with => @content_areas[i][:name]
    fill_in "content_area_content", :with => @content_areas[i][:content]

    click_button "Save"
  end
end

When /^I added those chapters to the CMS$/ do

  @child_chapters.each_with_index do |n, i|
    visit('/admin')
    fill_in_chapter(i, @child_chapters)
    click_button "Save"
  end

  @parent_chapters.each_with_index do |n, i|
    visit('/admin')
    fill_in_chapter(i, @parent_chapters)
    within("#chapter_child_ids_field") do
      click_link "Choose all"
    end
    click_button "Save"
  end
end

Then /^I should see those chapters$/ do
  visit("/support/knowledge_base/user_guide") #TODO paths in here?
  @parent_chapters.each_with_index do |n, i|
    page.has_content? @parent_chapters[i][:name]
  end
  @child_chapters.each_with_index do |n, i|
    page.has_content? @child_chapters[i][:name]
  end
end

Then /^I should see a summary of it's chapters$/ do
  visit("/support/knowledge_base/user_guide")
  @child_chapters.each_with_index do |n, i|
    page.has_content? @child_chapters[i][:summary]
  end
end

def fill_in_chapter(i, chapters)
  click_link "User Guide Chapters"
  click_link "Add new"
  fill_in "chapter_name", :with => chapters[i][:name]
  fill_in "chapter_summary", :with => chapters[i][:summary]
  fill_in "chapter_content", :with => chapters[i][:content]
  fill_in "chapter_sort_order", :with => chapters[i][:sort_order]
end
