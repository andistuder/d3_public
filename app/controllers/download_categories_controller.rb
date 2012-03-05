class DownloadCategoriesController < ApplicationController

  def index
    @download_categories = DownloadCategory.all(:order => "sort_order ASC")
    @downloads = Download.find_latest
  end

  def show
    @download_category = DownloadCategory.find(params[:id])
    @download_categories = DownloadCategory.all(:order => "sort_order ASC")
    #@downloads = DownloadCategory.find(params[:id]).downloads.find_latest
  end

  #def next
  #  @downloads = DownloadCategory.find(params[:cat]).downloads.find_next(params[:page])
  #  status = @downloads.length > 0 ? 200 : 204
  #  render :next, :status => status, :layout => false
  #end
end