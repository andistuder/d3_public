class ChaptersController < ApplicationController
  #def index
  #end
  #
  def show
    @chapters = Chapter.find_parents
    @chapter = Chapter.find(params[:id])
  end
end
