class CommentsController < ApplicationController
  def new
  	@comment = current_user.comments.new
  end

  def create
    @comment = current_user.comments.new comment_params
    if @comment.save
    	@review = @comment.review
    	@comments = @review.comments
    	@comment = current_user.comments.new
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    end
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit Comment::ATTRIBUTES_PARAMS
  end
end
