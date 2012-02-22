require 'spec_helper'

describe Partner do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:summary) }

  it { should have_and_belong_to_many(:assets) }
  it { should belong_to(:partner_category) }

  it "can be instantiated" do
    ProjectCategory.new.should be_an_instance_of(ProjectCategory)
  end

end