# frozen_string_literal: true

class AccountsController < ApplicationController
  def search
    @account = Account.search_or_create_account(params[:username], params[:sns])
    if @account
      redirect_to account_path(@account.id)
    end
  end

  def show
    @account = Account.new
    @account = Account.find(params[:id])
    @comments = Comment.where(account_id: params[:id])
  end

  private

  def account_params
    params.require(:account).permit(:sns, :username)
  end
end
