require 'spec_helper'

describe "case_studies/index.html.haml" do

  it "renders" do
    @test_case_study_cat = FactoryGirl.build(:case_study)
    @test_case_study_cat2 = FactoryGirl.build(:case_study)

    assign(:case_studies, [@test_case_study_cat, @test_case_study_cat2])

    render

    rendered.should have_content(@test_case_study_cat.name)
    rendered.should have_content(@test_case_study_cat.summary)
    rendered.should have_content(@test_case_study_cat.case_study_category_name)
    rendered.should have_content(@test_case_study_cat2.name)
    rendered.should have_content(@test_case_study_cat2.summary)
    rendered.should have_content(@test_case_study_cat2.case_study_category_name)
  end
end