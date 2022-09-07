class CommentsController < ApplicationController
  include ApplicationHelper

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @post = Post.find(params[:comment][:post_id])
    if @comment.save
      
      redirect_to @post
    else
      render 'new'
    end
  end
  
  

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
