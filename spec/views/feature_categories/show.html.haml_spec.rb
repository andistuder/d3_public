require 'spec_helper'

describe "feature_categories/show.html.haml" do

  it "renders" do

    @feature_category = FactoryGirl.create :feature_category
    @feature_category2 = FactoryGirl.create :feature_category
    @feature = FactoryGirl.create(:feature_item, :name => "feature1", :content => "Lorem1", :feature_category => @feature_category)
    @feature2 = FactoryGirl.create(:feature_item, :name => "feature2", :content => "Lorem2", :feature_category => @feature_category)
    @feature3 = FactoryGirl.create(:feature_item, :name => "feature3", :content => "Lorem3", :feature_category => @feature_category2)
    @feature4 = FactoryGirl.create(:feature_item, :name => "feature4", :content => "Lorem4", :feature_category => @feature_category2)

    assign(:feature_categories, [@feature_category, @feature_category2])
    assign(:feature_category, @feature_category)

    render

    rendered.should have_content(@feature_category.name)
    rendered.should have_content(@feature_category.content)
    rendered.should have_content(@feature.name)
    rendered.should have_content(@feature.content)
    rendered.should have_content(@feature2.name)
    rendered.should have_content(@feature2.content)
    rendered.should have_content(@feature3.name)
    rendered.should have_content(@feature4.name)
    rendered.should_not have_content(@feature3.content)
    rendered.should_not have_content(@feature4.content)
  end
end
