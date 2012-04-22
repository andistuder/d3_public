require 'spec_helper'

describe "partner_categories/show.html.haml" do
  it "renders" do
    @test_partner = FactoryGirl.build(:partner)
    @d3_partner = FactoryGirl.build(:partner, :name => "d3 Technologies")
    @test_partner_cat = FactoryGirl.create(:partner_category, :slug => "distributors", :partners => [@test_partner, @d3_partner])

    assign(:partner_category, @test_partner_cat)
    #assign(:partners, [@test_partner])
    #assign(:first_partner, @d3_partner)
    assign(:related_boxes, [])

    render

    rendered.should have_content(@test_partner_cat.name)
    rendered.should have_content(@test_partner_cat.content)
    rendered.should have_content(@test_partner.name)
    rendered.should have_content(@test_partner.summary)
    rendered.should have_content(@d3_partner.name)
    rendered.should have_content(@d3_partner.summary)
    rendered.should have_content(@d3_partner.phone)
    rendered.should have_content(@d3_partner.town)
    rendered.should have_content(@d3_partner.postcode)
    rendered.should have_content(@d3_partner.email)
    rendered.should have_content(@d3_partner.country)
    rendered.should have_content(@d3_partner.website)
    rendered.should have_content(@test_partner.phone)
    rendered.should have_content(@test_partner.town)
    rendered.should have_content(@test_partner.postcode)
    rendered.should have_content(@test_partner.email)
    rendered.should have_content(@test_partner.country)
    rendered.should have_content(@test_partner.website)
  end
end