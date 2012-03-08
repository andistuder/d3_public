require 'spec_helper'

describe "project_categories/show.html.haml" do

  it "renders" do
    @test_project = FactoryGirl.build:project
    @test_project2 = FactoryGirl.build :project
    @test_project3 = FactoryGirl.build(:project, :name => "ProjectThree")

    @test_project_cat = FactoryGirl.build(:project_category, :projects => [@test_project, @test_project2])

    assign(:project_category, @test_project_cat)
    assign(:project_categories, [@test_project_cat])
    assign(:related_boxes, [])

    render

    rendered.should have_content(@test_project_cat.name)
    rendered.should have_content(@test_project_cat.content)
    rendered.should have_content(@test_project.name)
    rendered.should have_content(@test_project2.name)
    rendered.should_not have_content(@test_project3.name)
  end
end