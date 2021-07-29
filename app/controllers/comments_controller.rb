# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to root_path, notice: '投稿完了'
  end

  def destroy; end

  private

  def comment_params
    params.require(:comment).permit(:account_id, :body)
  end
end
