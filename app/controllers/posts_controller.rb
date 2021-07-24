class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    # このインスタンス変数がviewで参照できる
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to  root_path, notice: '投稿完了'
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:sns_id, :account_id, :name, :desc)
  end
end