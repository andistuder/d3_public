class PagesController < ApplicationController

  
  def dynamic
    @page = Page.find_page(params[:slug])
    
    if @page.blank?
      raise ActiveRecord::RecordNotFound
    end
  end
end
