require 'spec_helper'

describe Download do
  it "has an item via paperclip" do
    Download.new.item.should_not be_nil
  end

  it "can be instantiated" do
    Download.new.should be_an_instance_of(Download)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }

  it { should have_and_belong_to_many(:categories) }

  it "have a friendly id" do
    @download = Download.new
    @download.respond_to?(:friendly_id).should be_true
  end
end
