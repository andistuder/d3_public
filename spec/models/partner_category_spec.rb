require 'spec_helper'

describe PartnerCategory do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }

  it { should have_and_belong_to_many(:assets) }
  it { should have_many(:partners) }

  it "can be instantiated" do
    ProjectCategory.new.should be_an_instance_of(ProjectCategory)
  end



  describe "find_in_oder" do
    before :each do
      @partner_cat1 = FactoryGirl.create(:partner_category, :sort_order => 1)
      @partner_cat2 = FactoryGirl.create(:partner_category, :sort_order => 2)
    end

    it "should load all records, by sort order asc" do
      PartnerCategory.find_in_order.should eq([@partner_cat1, @partner_cat2])
    end
  end

  describe "d3_partners" do
    before :each do
      @test_partner = FactoryGirl.create(:partner)
      @d3_partner = FactoryGirl.create(:partner, :name => "d3 Technologies")
      @test_partner_cat = FactoryGirl.create(:partner_category, :slug => "distributors", :partners => [@test_partner, @d3_partner])
    end

    it "should load all partners with named d3 Technologies" do
      @test_partner_cat.d3_partners.should eq([@d3_partner])
    end
  end

  describe "foreign_partners" do
    before :each do
      @test_partner = FactoryGirl.create(:partner)
      @d3_partner = FactoryGirl.create(:partner, :name => "d3 Technologies")
      @test_partner_cat = FactoryGirl.create(:partner_category, :slug => "distributors", :partners => [@test_partner, @d3_partner])
    end

    it "should load all partners not named d3 Technologies" do
      @test_partner_cat.foreign_partners.should eq([@test_partner])
    end
  end
end