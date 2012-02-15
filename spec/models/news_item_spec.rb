require 'spec_helper'

describe NewsItem do
  it "can be instantiated" do
    NewsItem.new.should be_an_instance_of(NewsItem)
  end

  it { should validate_presence_of(:headline) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:slug) }

  it { should have_and_belong_to_many(:assets) }

end
