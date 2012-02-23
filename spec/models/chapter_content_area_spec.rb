require 'spec_helper'

describe ChapterContentArea do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  it { should belong_to(:chapter) }
  it { should have_and_belong_to_many(:assets) }


  it "can be instantiated" do
    ChapterContentArea.new.should be_an_instance_of(ChapterContentArea)
  end
end
