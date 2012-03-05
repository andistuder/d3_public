class DownloadsController < ApplicationController
  def show
    @download = Download.find(params[:id])
    @download_categories = DownloadCategory.all(:order => "sort_order ASC")

  end
end
