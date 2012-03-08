require 'spec_helper'

describe "knowledge_base/user_guide.html.haml" do


  describe "populated render" do
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

      @user_guide_intro = FactoryGirl.build(:user_guide)
      @user_guide_body = FactoryGirl.build(:user_guide)

      assign(:chapters, @parents)
      assign(:user_guide_intro, @user_guide_intro)
      assign(:user_guide_body, @user_guide_body)
      assign(:related_boxes, [])

    end

    it "renders" do
      render

      rendered.should have_content(@user_guide_intro.content)
      rendered.should have_content(@user_guide_body.content)

      #chapters
      @parents.each do |parent|
        rendered.should have_content(parent.name)
      end

      @children.each do |child|
        rendered.should have_content(child.name)
        rendered.should have_content(child.summary)
      end

    end
  end


  describe "unpopulated render" do
    before :each do
      assign(:chapters, []) #AR always returns something for collection
      assign(:related_boxes, [])

    end
    it "renders" do
      render
      rendered.should have_content("User Guide") #page title
    end
  end


end
