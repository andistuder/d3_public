require 'spec_helper'

describe "projects/index.html.haml" do

  it "renders" do
    @test_asset = FactoryGirl.build :asset
    @test_project = FactoryGirl.build :project, :assets => [@test_asset]
    @test_project_cat = FactoryGirl.build :project_category, :projects => [@test_project]
    assign(:project_categories, [@test_project_cat])
    assign(:related_boxes, [])
    assign(:featured_projects, [@test_project])

    render

    rendered.should have_content(@test_project.name)
    #rendered.should_not have_content(@test_project_cat.name)
    #rendered.should_not have_content(@test_project_cat.summary)
  end
end