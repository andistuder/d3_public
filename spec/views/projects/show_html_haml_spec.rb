require 'spec_helper'

describe "projects/show.html.haml" do

  it "renders" do
    @test_pac = FactoryGirl.build :project_content_area
    @test_pac2 = FactoryGirl.build :project_content_area
    @test_project = FactoryGirl.build :project, :project_content_areas => [@test_pac, @test_pac2]
    @test_cat = FactoryGirl.build :project_category

    ProjectContentArea.should_receive(:ordered).and_return([@test_pac, @test_pac2])

    assign(:project, @test_project)
    assign(:project_categories, [@test_cat])

    render

    rendered.should have_content(@test_project.name)
    rendered.should have_content(@test_project.summary)
    rendered.should have_content(@test_project.how_made)
    rendered.should have_content(@test_project.how_made_title)
    rendered.should have_content(@test_pac.title)
    rendered.should have_content(@test_pac.content)
    rendered.should have_content(@test_pac2.title)
    rendered.should have_content(@test_pac2.content)
  end
end
