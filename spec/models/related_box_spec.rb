require 'spec_helper'

describe RelatedBox do
  it "can be instantiated" do
    RelatedBox.new.should be_an_instance_of(RelatedBox)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:link_label) }
  it { should validate_presence_of(:link_url) }

  it { should have_and_belong_to_many(:pages) }
  it { should belong_to(:asset) }

end
