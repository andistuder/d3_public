class PagesController < ApplicationController
  
  def dynamic
    @page = Page.find_page(params[:slug])
    
    if @page.blank?
      #redirect_to '/news', :alert => "Something went wrong and you are redirected to the news page. You can contact us on info@d3technologies.com"

      raise ActiveRecord::RecordNotFound
    end
  end
end
