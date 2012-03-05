require 'spec_helper'

describe "download_categories/show.html.haml" do

  it "renders" do
    @dlc = FactoryGirl.build :download_category
    @dlc1 = FactoryGirl.build :download_category
    @dl = FactoryGirl.build :download, :categories => [@dlc]
    @dl1 = FactoryGirl.build :download, :categories => [@dlc]

    assign(:downloads, [@dl, @dl1])
    assign(:download_categories, [@dlc, @dlc1])
    assign(:download_category, @dlc)

    render

    rendered.should have_content(@dl.name)
    rendered.should have_content(@dl.content)
    rendered.should have_content(@dl1.name)
    rendered.should have_content(@dl1.content)

    rendered.should have_content(@dlc.name)
    rendered.should have_content(@dlc1.name)

  end
end