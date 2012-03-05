require 'spec_helper'

describe "downloads/show.html.haml" do

  it "renders" do
    @dlc = FactoryGirl.build :download_category
    @dlc1 = FactoryGirl.build :download_category
    @dl = FactoryGirl.build :download, :categories => [@dlc]
    assign(:download, @dl)
    assign(:download_categories, [@dlc, @dlc1])

    render

    rendered.should have_content(@dl.name)
    rendered.should have_content(@dl.content)

    rendered.should have_content(@dlc.name)
    rendered.should have_content(@dlc1.name)

  end
end