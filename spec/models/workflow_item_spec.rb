require 'spec_helper'

describe WorkflowItem do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:list_title) }
  it { should validate_presence_of(:content_area) }
  it { should validate_presence_of(:list_area) }
  it { should validate_presence_of(:overlay) }

  it { should belong_to(:asset) }

  it "can be instantiated" do
    WorkflowItem.new.should be_an_instance_of(WorkflowItem)
  end
end