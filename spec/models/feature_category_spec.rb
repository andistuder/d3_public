require 'spec_helper'

describe FeatureCategory do
  it "can be instantiated" do
    FeatureCategory.new.should be_an_instance_of(FeatureCategory)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  #it { should validate_uniqueness_of(:slug) }

  it { should have_and_belong_to_many(:assets) }
  it { should have_many(:features) }

  describe "FeatureCategory#previous_feature_cat" do
    pending "Factory test to be added?"
  end

  describe "FeatureCategory#next_feature_cat" do
    pending "Factory test to be added?"
  end

end
