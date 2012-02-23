require 'spec_helper'

describe Feature do
  it "can be instantiated" do
    Category.new.should be_an_instance_of(Category)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }

  it { should belong_to(:asset) }
  it { should belong_to(:feature_category) }
  it { should have_and_belong_to_many(:projects) }

  describe "Feature#ordered" do
    pending "need to test ordered scope"
  end

end