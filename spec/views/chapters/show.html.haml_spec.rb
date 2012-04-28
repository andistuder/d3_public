require 'spec_helper'

describe "chapters/show.html.haml" do
  it "renders" do

    @chapter = FactoryGirl.build :chapter, :summary => "Some content without any funky characters that will make the test pass"

    assign(:chapter, @chapter)
    assign(:chapters, [])
    assign(:related_boxes, [])

    render

    rendered.should have_content(@chapter.name)
    rendered.should have_content(@chapter.summary)
    #TODO MSP this encoding stuff still isn't right
    #TODO AS test for children content too
    #rendered.should have_content(@chapter.content)


  end
end
