require 'spec_helper'

describe "case_studies/show.html.haml" do
  it "renders" do
    @feature = FactoryGirl.create(:feature_item, :feature_category => FactoryGirl.create(:feature_category))
    @test_case_study = FactoryGirl.build(:case_study, :features => [@feature])

    assign(:case_study, @test_case_study)
    assign(:related_boxes, [])

    render

    rendered.should have_content(@test_case_study.name)
    rendered.should have_content(@test_case_study.introduction)
    rendered.should have_content(@test_case_study.content)
    rendered.should have_content(@test_case_study.sidebar_title)
    rendered.should have_content(@test_case_study.sidebar)
    rendered.should have_content(@feature.name)
  end
end