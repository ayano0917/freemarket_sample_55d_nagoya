class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if user_sign_in?
      @comment.save
      redirect_to item_path
    end


  end

  private

  def comment_params
    params.permit(:content, :item_id)
  end
  
end