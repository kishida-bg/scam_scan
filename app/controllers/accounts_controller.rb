class AccountsController < ApplicationController
  def search
    @accounts = Account.search(params[:username])
  end

  def index
    @accounts = Account.all
  end

  def new
    # このインスタンス変数がviewで参照できる
    @account = Account.new
  end

  def create
    Account.create(account_params)
    redirect_to  root_path, notice: '投稿完了'
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def account_params
    params.require(:account).permit(:sns_id, :account_id, :name, :desc)
  end
end