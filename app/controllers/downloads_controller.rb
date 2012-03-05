class DownloadsController < ApplicationController
  def show
    @download = Download.find(params[:id])
  end
end
