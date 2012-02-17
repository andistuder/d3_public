require 'spec_helper'

describe ProjectCategory do

  it "can be instantiated" do
    ProjectCategory.new.should be_an_instance_of(ProjectCategory)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:content) }

  it { should have_and_belong_to_many(:projects) }

end