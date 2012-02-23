require 'spec_helper'

describe CaseStudy do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:case_study_category_name) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:assets) }

  it { should have_and_belong_to_many(:assets) }
  it { should have_and_belong_to_many(:features) }

  it "can be instantiated" do
    CaseStudy.new.should be_an_instance_of(CaseStudy)
  end

  describe "database finders" do

    describe "find_in_oder" do
      before :each do
        @case_study1 = FactoryGirl.create(:case_study, :sort_order => 1)
        @case_study2 = FactoryGirl.create(:case_study, :sort_order => 2)
      end

      it "should load all records, by sort order asc" do
        CaseStudy.find_in_order.should eq([@case_study1, @case_study2])
      end
    end
  end

  describe "find_next and find_previous" do

    before :each do
      @case_study1 = FactoryGirl.create(:case_study, :sort_order => 1)
      @case_study2 = FactoryGirl.create(:case_study, :sort_order => 2)
      @case_study3 = FactoryGirl.create(:case_study, :sort_order => 3)
    end

    it "should find the previous record according to sort order value" do
      @case_study2.find_next.should eq(@case_study3)
    end

    it "should find the previous record according to sort order value" do
      @case_study2.find_previous.should eq(@case_study1)
    end
  end

end