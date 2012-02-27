describe "faq/show.html.haml" do
  it "renders" do

    @faq_cats = []

    2.times do |j|
      @faq_cats << Factory.build(:faq_category, :sort_order => j)
    end

    assign(:faq_category, @faq_cats[0])
    assign(:faq_categories, @faq_cats)

    render

    #TODO finish me
    @faq_cats.each do |faq_cat|
      rendered.should have_content(faq_cat.name)
    end

  end
end

