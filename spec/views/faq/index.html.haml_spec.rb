require 'spec_helper'

describe "faq/index.html.haml" do
  it "renders" do

    @faqs = []
    @faq_cats = []

    2.times do |i|
      @faqs <<  Factory.build(:faq, :sort_order => i, :answer => "Something very insightful #{i}")
    end

    2.times do |j|
      @faq_cats << Factory.build(:faq_category, :sort_order => j)
    end

    assign(:faqs, @faqs)
    assign(:faq_categories, @faq_cats)

    render

    @faqs.each do |faq|
      rendered.should have_content(faq.question)
      rendered.should have_content(faq.answer)
    end

    @faq_cats.each do |faq_cat|
      rendered.should have_content(faq_cat.name)
    end

  end
end
