require 'spec_helper'

describe "pages/dynamic.html.haml" do

  it "renders " do

    @page = FactoryGirl.build(:page, :name => "tutorial", :slug => "tutorial")
    assign(:page, @page)
    assign(:related_boxes, [])

    render
    rendered.should have_content(@page.name)

  end

  it "renders with non existent partial, using content areas" do

    @page = FactoryGirl.build(:page, :name => "tutorial", :slug => "xx-this-partial-doesnt-exist")
    @page_content_area = FactoryGirl.build(:user_guide, :name => "user guide", :content => "user guide content area")
    @page.should_receive(:content_areas).and_return([@page_content_area])
    assign(:page, @page)
    assign(:related_boxes, [])


    render
    rendered.should have_content(@page.name)
    rendered.should have_content(@page_content_area.name)
    rendered.should have_content(@page_content_area.content)

  end

end
