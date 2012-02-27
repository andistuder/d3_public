class FaqController < ApplicationController
  def index
    @faq_categories = FaqCategory.order("sort_order ASC")
    @faqs = Faq.order("sort_order ASC")
  end

  def show
    @faq_category = FaqCategory.find(params[:id])
    @faq_categories = FaqCategory.order("sort_order ASC")
  end
end
