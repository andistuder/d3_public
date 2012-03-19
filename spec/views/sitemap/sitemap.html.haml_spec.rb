require 'spec_helper'

describe "sitemap/sitemap.builder" do
  it "renders the default attributes" do
    assign(
        :pages, [
        stub_model(Page, :name => "about", :slug => "about", :updated_at => Time.now),
        stub_model(Page, :name => "contact", :slug => "contact", :updated_at => Time.now)
    ])

    #assign(:pages = Page.all
    assign(:news_items, [])
    assign(:announcements, [])
    assign(:projects, [])
    assign(:project_categories, [])
    assign(:case_studies, [])
    assign(:feature_categories, [])
    assign(:downloads, [])
    assign(:faq_categories, [])
    assign(:partner_categories, [])
    assign(:partners, [])
    assign(:chapters, [])
    assign(:related_boxes, [])

    render :template => "sitemap/sitemap.builder"

    rendered.should have_xpath('//urlset[@xmlns="http://www.google.com/schemas/sitemap/0.84"]')
    rendered.should have_xpath("//urlset/url[loc=\"#{D3::Application::SITE_URL}\"]")
    rendered.should have_xpath("//urlset/url[loc=\"#{D3::Application::SITE_URL}about\"]")
    rendered.should have_xpath("//urlset/url[loc=\"#{D3::Application::SITE_URL}contact\"]")
  end

end
