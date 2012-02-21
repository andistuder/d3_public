class KnowledgeBaseController < ApplicationController
  def user_guide
    @chapters = Chapter.find_parents
  end
end
