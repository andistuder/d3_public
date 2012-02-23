require 'spec_helper'

describe "partners/show.html.haml" do

  it "renders" do
    @test_pac= FactoryGirl.build :partner_content_area
    @test_pac2= FactoryGirl.build :partner_content_area

    @test_partner = FactoryGirl.build(:partner, :partner_content_areas => [@test_pac, @test_pac2])

    PartnerContentArea.should_receive(:ordered).and_return([@test_pac, @test_pac2])

    assign(:partner, @test_partner)

    render

    rendered.should have_content(@test_partner.name)
    #rendered.should have_content(@test_partner.summary)
    rendered.should have_content(@test_partner.phone)
    rendered.should have_content(@test_partner.town)
    rendered.should have_content(@test_partner.postcode)
    rendered.should have_content(@test_partner.email)
    rendered.should have_content(@test_partner.country)
    rendered.should have_content(@test_partner.website)

    rendered.should have_content(@test_pac.title)
    rendered.should have_content(@test_pac.content)
    rendered.should have_content(@test_pac2.title)
    rendered.should have_content(@test_pac2.content)

  end
end