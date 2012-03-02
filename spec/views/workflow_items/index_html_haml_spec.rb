require 'spec_helper'

describe "workflow_items/index.html.haml" do

  it "renders" do
    @wfi = FactoryGirl.build :workflow_item, :sort_order => 1
    @wfi1 = FactoryGirl.build :workflow_item, :sort_order => 2
    assign(:workflow_items, [@wfi, @wfi1])

    render

    rendered.should have_content(@wfi.title)
    rendered.should have_content(@wfi.list_title)
    rendered.should have_content(@wfi.content_area)
    rendered.should have_content(@wfi.list_area)

    rendered.should have_content(@wfi1.title)
    rendered.should have_content(@wfi1.list_title)
    rendered.should have_content(@wfi1.content_area)
    rendered.should have_content(@wfi1.list_area)

  end
end