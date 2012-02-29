class FaqController < ApplicationController
  def index
    @faq_category = FaqCategory.find_by_slug("most-popular")
    @faq_category = FaqCategory.first if !@faq_category.present?

    redirect_to :action => "show", :id => @faq_category.friendly_id
  end

  def show

    @faq_category = nil
    @faq_categories = []

    if params[:id].present?
      @faq_category = FaqCategory.find(params[:id])
      @faq_categories = FaqCategory.order("sort_order ASC")
    end
  end
end
