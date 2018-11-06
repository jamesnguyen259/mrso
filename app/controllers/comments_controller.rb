class CommentsController < ApplicationController
  before_action :find_comment, only: %i(edit update)
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

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to @comment.review
    else
      render "edit"
    end
  end

  private
  def comment_params
    params.require(:comment).permit Comment::ATTRIBUTES_PARAMS
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
  end
end
