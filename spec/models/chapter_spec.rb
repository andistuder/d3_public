require 'spec_helper'

describe Chapter do
  it "can be instantiated" do
    Chapter.new.should be_an_instance_of(Chapter)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:content) }

  it { should have_many(:content_areas) }

  it "acts as tree" do
    @chapter = Chapter.new
    @chapter.respond_to?(:parent).should be_true
  end
  
  it "have sa friendly id" do
    @chapter = Chapter.new
    @chapter.respond_to?(:friendly_id).should be_true
  end

  it "should give the previous_chapter" do
    @chapter = Chapter.new
    @chapter.respond_to?(:previous_chapter).should be_true
  end

  it "should give the next_chapter" do
    @chapter = Chapter.new
    @chapter.respond_to?(:next_chapter).should be_true
  end

end
