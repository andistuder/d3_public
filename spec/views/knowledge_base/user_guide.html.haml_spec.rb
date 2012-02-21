require 'spec_helper'

describe "knowledge_base/user_guide.html.haml" do

  before :each do
    @parents = []
    @children = []

    2.times do |i|
      parent = FactoryGirl.build(:chapter, :name => "parent_chapter#{i}", :created_at => Time.now - (1000 * i))

      2.times do |j|
        @children << FactoryGirl.build(:chapter, :name => "child_chapter#{i}-#{j}", :created_at => Time.now - (1000 * i))
      end

      parent.should_receive(:children).at_least(1).times.and_return(@children)
      @parents << parent
    end

    assign(:chapters, @parents)

  end

  it "renders" do
    render

    @parents.each do |parent|
      #pp parent.children
      rendered.should have_content(parent.name)
    end

    @children.each do |child|
      rendered.should have_content(child.name)
    end

  end
end
