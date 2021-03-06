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
    visit('/admin/content_area/new')

    #click_link "Content areas"
    #click_link "Add new"
    fill_in "content_area_name", :with => @content_areas[i][:name]
    fill_in "content_area_content", :with => @content_areas[i][:content]

    click_button "Save"
  end
end

When /^I added those chapters to the CMS$/ do


  @parent_chapters.each_with_index do |n, i|
    visit('/admin/chapter')
    fill_in_chapter(i, @parent_chapters)
    #within("#chapter_child_ids_field") do
    #  click_link "Choose all"
    #end
    click_button "Save"
  end

  @child_chapters.each_with_index do |n, i|
    chapter = Chapter.new
    chapter.name = n[:name]
    #chapter.summary = n[:summary]
    chapter.content = n[:content]
    chapter.sort_order = n[:sort_order]
    chapter.parent = Chapter.first
    chapter.save
    #visit('/admin/chapter')
    #fill_in_chapter(i, @child_chapters)
    #within '#chapter_parent_id_field' do
    #  fill_in "", :with => @parent_chapters[0][:name]
    #end
    #select @parent_chapters[0][:name], :from => "chapter_parent_id"
    #within("#chapter_content_area_ids_field") do
    #  click_link "Choose all"
    #end

    #click_button "Save"
  end


end

Then /^I should see those chapters$/ do
  #visit("/preview/knowledge-base/user-guide") #TODO paths in here?
  @parent_chapters.each_with_index do |n, i|
    page.has_content? @parent_chapters[i][:name]
  end
  @child_chapters.each_with_index do |n, i|
    page.has_content? @child_chapters[i][:name]
  end
end

#Then /^I should see a summary of it's chapters$/ do
#  visit("/preview/knowledge_base/user_guide")
#  @child_chapters.each_with_index do |n, i|
#    page.has_content? @child_chapters[i][:content]
#  end
#end

Then /^I should see a the chapter detail$/ do

  page.has_content? @parent_chapters[0][:name]
  page.has_content? @parent_chapters[0][:content]
  page.has_content? @child_chapters[0][:content]
  page.has_content? @child_chapters[0][:content]
  page.has_content? @child_chapters[1][:content]
  page.has_content? @child_chapters[1][:content]

  #@content_areas.each_with_index do |n, i|
  #  page.has_content? @content_areas[i][:name]
  #end

end

def fill_in_chapter(i, chapters)
  #within(".sidebar-nav") do
  #   click_link "User guide chapters"
  #end
  visit('/admin/chapter/new')
  #click_link "Add new"
  fill_in "chapter_name", :with => chapters[i][:name]
  #fill_in "chapter_summary", :with => chapters[i][:summary]
  fill_in "chapter_content", :with => chapters[i][:content]
  fill_in "chapter_sort_order", :with => chapters[i][:sort_order]
end

#When /^I click span "([^"]*)"$/ do |arg|
#  find("##{arg} span").click
#end

When /^I wait for "([^"]*)" to appear$/ do |arg|
  wait_until{ page.has_content?(arg)}
end