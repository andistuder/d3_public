require 'spec_helper'

describe "news_items/show.html.haml" do

  it "renders" do

    @news_item = FactoryGirl.create :news_item

    assign(:news_item, @news_item)
    assign(:related_boxes, [])

    render

    rendered.should have_content(@news_item.headline)
    rendered.should_not have_content(@news_item.summary)
    rendered.should have_content(@news_item.content)

  end

end
