require 'spec_helper'

describe PartnerCategory do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }

  it { should have_and_belong_to_many(:assets) }
  it { should have_many(:partners) }

  it "can be instantiated" do
    ProjectCategory.new.should be_an_instance_of(ProjectCategory)
  end

end