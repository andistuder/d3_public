require 'spec_helper'

describe PartnerContentArea do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  it { should belong_to(:partner) }


  it "can be instantiated" do
    PartnerContentArea.new.should be_an_instance_of(PartnerContentArea)
  end

end