# frozen_string_literal: true

class AccountsController < ApplicationController
  def search
    @account = Account.search(params[:username], params[:sns])
    if @account
      redirect_to account_path(@account.id)
    end
  end

  def show
    @account = Account.new
    # p "ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー"
    @account = Account.find(params[:id])
    # p "ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー"
    # @account = Account.search(params[:account][:username], params[:account][:sns])
    @comments = Comment.where(account_id: params[:id])
  end

  private

  def account_params
    params.require(:account).permit(:sns, :username)
  end
end
