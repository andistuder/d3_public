require 'spec_helper'

describe PartnerCategory do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }

  it { should have_and_belong_to_many(:assets) }
  it { should have_many(:partners) }

  it "can be instantiated" do
    ProjectCategory.new.should be_an_instance_of(ProjectCategory)
  end

  describe "database finders" do

    describe "find_in_oder" do
      before :each do
        @partner_cat1 = FactoryGirl.create(:partner_category, :sort_order => 1)
        @partner_cat2 = FactoryGirl.create(:partner_category, :sort_order => 2)
      end

      it "should load all records, by sort order asc" do
        PartnerCategory.find_in_order.should eq([@partner_cat1, @partner_cat2])
      end
    end
  end


end