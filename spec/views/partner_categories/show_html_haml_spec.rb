require 'spec_helper'

describe "partner_categories/show.html.haml" do
  it "renders" do
    @test_partner = FactoryGirl.build(:partner, :partner_category => @test_partner_cat)
    @test_partner2 = FactoryGirl.build(:partner, :partner_category => @test_partner_cat)
    @test_partner_cat = FactoryGirl.build(:partner_category, :slug => "distributors", :partners => [@test_partner, @test_partner2])

    assign(:partner_category, @test_partner_cat)

    render

    rendered.should have_content(@test_partner_cat.name)
    rendered.should have_content(@test_partner_cat.content)
    rendered.should have_content(@test_partner.name)
    rendered.should have_content(@test_partner.summary)
    rendered.should have_content(@test_partner2.name)
    rendered.should have_content(@test_partner2.summary)
    rendered.should have_content(@test_partner2.phone)
    rendered.should have_content(@test_partner2.town)
    rendered.should have_content(@test_partner2.postcode)
    rendered.should have_content(@test_partner2.email)
    rendered.should have_content(@test_partner2.country)
    rendered.should have_content(@test_partner2.website)
    rendered.should have_content(@test_partner.phone)
    rendered.should have_content(@test_partner.town)
    rendered.should have_content(@test_partner.postcode)
    rendered.should have_content(@test_partner.email)
    rendered.should have_content(@test_partner.country)
    rendered.should have_content(@test_partner.website)
  end
end