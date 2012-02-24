class ChaptersController < ApplicationController
  #def index
  #end
  #
  def show
    @chapters = Chapter.find_parents
    @chapter = Chapter.find(params[:id])
    @user_guide_intro = ContentArea.find_by_name("user_guide_intro")
    @user_guide_body = ContentArea.find_by_name("user_guide_body")

  end
end
