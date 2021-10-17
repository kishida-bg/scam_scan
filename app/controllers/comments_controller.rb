# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @account = Account.find(params[:id])
  end

  def create
    account = Account.find(params[:comment][:account_id])
    account.comments.build(comment_params)
    if account.save
      redirect_to root_path, notice: "投稿に成功しました"
      # 現在のshowページに遷移するときはaccount_pathの後にパラメータを指定しないといけない
      # 成功したとき、（POSTメソッドの時　など）redirect_to
    else
      render root, alert: '投稿に失敗しました'
      # 失敗ならrender
    end
  end

  def destroy; end

  private

  def comment_params
    params.require(:comment).permit(:account_id, :body)
  end
end
