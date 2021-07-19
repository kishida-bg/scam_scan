class PostsController < ApplicationController
  def index
  end

  def new
    # このインスタンス変数がviewで参照できる
    @post = Post.new
  end

  def show
  end

  def destroy
  end

  def update
  end
end