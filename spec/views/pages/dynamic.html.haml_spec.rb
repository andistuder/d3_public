require 'spec_helper'

describe "pages/dynamic.html.haml" do

  it "renders " do

    @page = FactoryGirl.build(:tutorial_page, :name => "tutorial", :slug => "home")
    assign(:page, @page)

    render
    rendered.should have_content(@page.name)

  end

end
