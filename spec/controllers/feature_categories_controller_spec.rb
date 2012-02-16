require 'spec_helper'

describe FeatureCategoriesController do

  before :each do
    @feature_category = FactoryGirl.build :feature_category
    @feature_category2 = FactoryGirl.build :feature_category

    FeatureCategory.stub(:order).and_return([@feature_category, @feature_category2])
    FeatureCategory.stub(:find).and_return(@feature_category2)
  end

  describe "GET index" do
    it "assigns all feature_categories as @feature_categories" do
      get :index, {}
      assigns(:feature_categories).should eq([@feature_category, @feature_category2])
    end
  end

  describe "GET show" do
    it "assigns the requested feature_category as @feature_category" do
      get :show, {:id => 1}
      assigns(:feature_category).should eq(@feature_category2)
    end

    it "assigns all feature_categories as @feature_categories" do
      get :show, {:id => 1}
      assigns(:feature_categories).should eq([@feature_category, @feature_category2])
    end
  end

end
