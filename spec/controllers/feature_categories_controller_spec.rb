require 'spec_helper'

describe FeatureCategoriesController do

  def valid_attributes
    {
      :name => "category 1",
      :slug => "category1"
    }
  end
  
  describe "GET index" do
    it "assigns all feature_categories as @feature_categories" do
      feature_category = FeatureCategory.create! valid_attributes
      get :index, {}
      assigns(:feature_categories).should eq([feature_category])
    end
  end

  describe "GET show" do
    it "assigns the requested feature_category as @feature_category" do
      feature_category = FeatureCategory.create! valid_attributes
      get :show, {:id => feature_category.to_param}
      assigns(:feature_category).should eq(feature_category)
    end

    it "assigns all feature_categories as @feature_categories" do
      feature_category = FeatureCategory.create! valid_attributes
      get :show, {:id => feature_category.to_param}
      assigns(:feature_categories).should eq([feature_category])
    end
  end

end
