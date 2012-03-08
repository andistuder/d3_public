require 'spec_helper'

describe "download_categories/index.html.haml" do

  it "renders" do
    @dlc = FactoryGirl.build :download_category
    @dl = FactoryGirl.build :download
    @dl1 = FactoryGirl.build :download
    @dlc1 = FactoryGirl.build :download_category


    assign(:downloads, [@dl, @dl1])
    assign(:download_categories, [@dlc, @dlc1])
    assign(:related_boxes, [])

    render

    rendered.should have_content(@dl.name)
    rendered.should have_content(@dl.content)
    rendered.should have_content(@dl1.name)
    rendered.should have_content(@dl1.content)

    rendered.should have_content(@dlc1.name)
    rendered.should have_content(@dlc.name)

  end
end