require 'spec_helper'

describe "news_items/announcements.html.haml" do

  it "renders " do

    @news_item = FactoryGirl.build :news_item
    @news_item2 = FactoryGirl.build :news_item

    assign(:news_items, [@news_item2, @news_item])
    assign(:related_boxes, [])

    render

    rendered.should have_content(@news_item.headline)
    rendered.should have_content(@news_item.content)

    rendered.should have_content(@news_item2.headline)
    rendered.should have_content(@news_item2.content)
  end

end
