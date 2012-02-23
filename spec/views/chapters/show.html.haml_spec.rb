require 'spec_helper'

describe "chapters/show.html.haml" do
  it "renders" do

    @chapter = FactoryGirl.build :chapter
    @chapter_content_area = FactoryGirl.build :chapter_content_area

    @chapter.should_receive(:content_areas).and_return([@chapter_content_area])

    assign(:chapter, @chapter)
    assign(:chapters, [])

    render

    rendered.should have_content(@chapter.name)
    rendered.should_not have_content(@chapter.summary)
    rendered.should have_content(@chapter.content)

    rendered.should have_content(@chapter_content_area.title)
    rendered.should have_content(@chapter_content_area.content)

  end
end
