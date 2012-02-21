require 'spec_helper'

describe Chapter do
  it "can be instantiated" do
    Chapter.new.should be_an_instance_of(Chapter)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:content) }

  it "acts as tree" do
    @chapter = Chapter.new
    @chapter.respond_to?(:parent).should be_true
  end
  
  it "have sa friendly id" do
    @chapter = Chapter.new
    @chapter.respond_to?(:friendly_id).should be_true
  end

end
