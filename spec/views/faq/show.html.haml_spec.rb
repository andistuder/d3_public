require 'spec_helper'

describe "faq/show.html.haml" do
  it "renders" do

    @faqs = []
    @faq_cats = []

    2.times do |j|
      @faq_cats << FactoryGirl.build(:faq_category, :sort_order => j)
    end

    4.times do |k|
      @faqs << FactoryGirl.build(:faq, :sort_order => k, :question => "question#{k}", :answer => "answer#{k}")
    end

    @faq_cats[0].stub(:faqs).and_return(@faqs)

    assign(:faq_category, @faq_cats[0])
    assign(:faq_categories, @faq_cats)

    render

    @faq_cats.each do |faq_cat|
      rendered.should have_content(faq_cat.name)
    end

    @faq_cats[0].faqs.each do |faq|
      rendered.should have_content(faq.question)
      rendered.should have_content(faq.answer)
    end

  end
end

