class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    flash.alert = "Error: #{@comment.errors.full_messages.join}" unless @comment.save
    redirect_to post_path(@comment.commentable_id)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to root_path
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
