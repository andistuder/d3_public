require 'spec_helper'

describe "projects/show.html.haml" do

  it "renders" do
    @test_project = FactoryGirl.build :project
    assign(:project, @test_project)

    render

    rendered.should have_content(@test_project.name)
    rendered.should have_content(@test_project.summary)
    rendered.should have_content(@test_project.how_made)
    rendered.should have_content(@test_project.how_made_title)
  end
end
