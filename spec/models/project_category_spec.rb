require 'spec_helper'

describe ProjectCategory do


  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:projects) }

  it { should have_and_belong_to_many(:projects) }


  it "can be instantiated" do
    ProjectCategory.new.should be_an_instance_of(ProjectCategory)
  end

  describe "database finders" do

    describe "find_in_oder" do
      before :each do
        @test_asset = FactoryGirl.create :asset
        @test_project = FactoryGirl.create(:project, :assets => [@test_asset])
        @project_cat1 = FactoryGirl.create(:project_category, :sort_order => 1, :projects => [@test_project])
        @project_cat2 = FactoryGirl.create(:project_category, :sort_order => 2, :projects => [@test_project])
      end

      it "should load all records, by sort order asc" do
        ProjectCategory.find_in_order.should eq([@project_cat1, @project_cat2])
      end
    end
  end

end