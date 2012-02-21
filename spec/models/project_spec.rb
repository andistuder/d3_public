require 'spec_helper'

describe Project do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:how_made) }
  it { should validate_presence_of(:how_made_title) }
  it { should validate_presence_of(:assets) }

  it { should have_and_belong_to_many(:assets) }
  it { should have_and_belong_to_many(:features) }
  it { should belong_to(:how_made_image) }
  it { should have_many(:project_content_areas) }

  it "can be instantiated" do
    Project.new.should be_an_instance_of(Project)
  end

  describe "Project#previous" do
    pending "Factory test to be added?"
  end

  describe "Project#next" do
    pending "Factory test to be added?"
  end

end
