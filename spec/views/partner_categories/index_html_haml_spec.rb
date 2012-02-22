require 'spec_helper'

describe "partner_categories/index.html.haml" do

  it "renders" do
    @test_partner_cat = FactoryGirl.build(:partner_category, :slug => "distributors")
    @test_partner_cat2 = FactoryGirl.build(:partner_category, :slug => "users")

    assign(:partner_categories, [@test_partner_cat, @test_partner_cat2])

    render

    rendered.should have_content(@test_partner_cat.name)
    rendered.should have_content(@test_partner_cat.content)
    rendered.should have_content(@test_partner_cat2.name)
    rendered.should have_content(@test_partner_cat2.content)
  end
end