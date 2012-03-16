class DownloadCategoriesController < ApplicationController

  def index
    @download_categories = DownloadCategory.all(:order => "sort_order ASC")
    @downloads = Download.find_latest
    @og_title = "Downloads - #{@og_site_name}"

  end

  def show
    @download_category = DownloadCategory.find(params[:id])
    @download_categories = DownloadCategory.all(:order => "sort_order ASC")
    @og_title = "Downloads - #{@og_site_name}"

  end

  def next
    if params[:cat].present?
      @downloads = DownloadCategory.find(params[:cat]).downloads.find_next(params[:page])
    else
      @downloads = Download.find_next(params[:page])
    end
    status = @downloads.length > 0 ? 200 : 204
    render :next, :status => status, :layout => false
  end
end