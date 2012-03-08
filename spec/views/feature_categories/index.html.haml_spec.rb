require 'spec_helper'

describe "feature_categories/index.html.haml" do

  it "renders" do

  @feature_category = FactoryGirl.build :feature_category
  @feature_category2 = FactoryGirl.build :feature_category

  assign(:feature_categories, [@feature_category2, @feature_category])
  assign(:related_boxes, [])

  render

  rendered.should have_content(@feature_category2.name)
  rendered.should have_content(@feature_category2.content)
  rendered.should have_content(@feature_category.name)
  rendered.should have_content(@feature_category.content)
  end
end
