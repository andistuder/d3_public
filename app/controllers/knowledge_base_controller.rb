class KnowledgeBaseController < ApplicationController
  def user_guide
    @chapters = Chapter.find_parents
    @user_guide_intro = ContentArea.find_by_name("user_guide_intro")
    @user_guide_body = ContentArea.find_by_name("user_guide_body")
    @og_title = "User Guide - #{@og_site_name}"

  end
end
