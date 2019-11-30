class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(content: comment_params[:content], item_id: comment_params[:item_id], user_id: current_user.id)
    Comment.transaction do
      if @comment.save
        redirect_to item_path(comment_params[:item_id]), notice: 'コメントしました'
      else
        redirect_to item_path(comment_params[:item_id]), alert: 'コメントを入力してください'
      end 
    end   
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(item_id: params[:item_id])
  end
  
end