class PagesController < ApplicationController
  
  def dynamic
    @page = Page.find_page(params[:slug])
    
    if @page.blank?
      #redirect_to '/news', :alert => "Something went wrong and you are redirected to the news page. You can contact us on info@d3technologies.com"

      raise ActiveRecord::RecordNotFound
    end

    @og_title = @page.name
    @og_type = "Web page"
    @og_url = request.url
    @og_image = @page.assets.first.asset.url(:original) if @page.assets.present?
    @og_description = textilize(Page.find_by_slug('company').introduction).strip_tags if @page.introduction.present?
  end
end
