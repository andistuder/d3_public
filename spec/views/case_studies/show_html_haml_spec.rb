require 'spec_helper'

describe "case_studies/show.html.haml" do
  it "renders" do
    @test_case_study = FactoryGirl.build(:case_study, :features => [Factory(:feature_item)])

    assign(:case_study, @test_case_study)
    assign(:related_boxes, [])

    render

    rendered.should have_content(@test_case_study.name)
    rendered.should have_content(@test_case_study.introduction)
    rendered.should have_content(@test_case_study.content)
    rendered.should have_content(@test_case_study.sidebar_title)
    rendered.should have_content(@test_case_study.sidebar)
    rendered.should have_content(@test_case_study.features.first.name)
  end
end