class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end


  private

  def comment_params
    params.require(:comment).private(:comment_title, :comment)
  end

  def customer_params
    params.require(:customer).private(:account)
  end
end
