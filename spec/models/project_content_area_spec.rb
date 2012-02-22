require 'spec_helper'

describe ProjectContentArea do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  #it { should validate_presence_of(:asset) }

  it { should belong_to(:project) }
  it { should belong_to(:asset) }


  it "can be instantiated" do
    ProjectContentArea.new.should be_an_instance_of(ProjectContentArea)
  end

end