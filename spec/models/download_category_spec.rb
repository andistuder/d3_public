require 'spec_helper'

describe DownloadCategory do
  it "can be instantiated" do
    DownloadCategory.new.should be_an_instance_of(DownloadCategory)
  end

  it { should validate_presence_of(:name) }
  it { should have_and_belong_to_many(:downloads) }

  it "have a friendly id" do
    @dc = DownloadCategory.new
    @dc.respond_to?(:friendly_id).should be_true
  end
end