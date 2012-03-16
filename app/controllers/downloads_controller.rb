class DownloadsController < ApplicationController
  def show
    @download = Download.find(params[:id])
    @download_categories = DownloadCategory.all(:order => "sort_order ASC")
    @og_title = @download.name
    @og_description = textilize(@download.content).strip_tags

  end
end
