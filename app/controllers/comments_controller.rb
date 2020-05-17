class CommentsController < ApplicationController
  before_action :find_commentable, only: [:create]
  before_action :set_comment, except: [:create]
  before_action :authenticate_user!

  def create
    @comment = @commetable.comment.build(comment_params)
    @comment.user = current_user
    @comment.reply = true if params[:comment_id]
    @comment.save
  end
  def edit
    
  end
  def destroy
    
  end
  def history
    
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
  def find_commentable
    #Comment
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
    elsif params[:post_id]
    #Post
      @commentable = Post.friendly.find(params[:post_id])
    end
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
