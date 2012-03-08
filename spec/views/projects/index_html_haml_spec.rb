require 'spec_helper'

describe "projects/index.html.haml" do

  it "renders" do
    @test_project_cat = FactoryGirl.build :project_category
    assign(:project_categories, [@test_project_cat])
    assign(:related_boxes, [])

    render

    rendered.should have_content(@test_project_cat.name)
    rendered.should have_content(@test_project_cat.summary)
  end
end