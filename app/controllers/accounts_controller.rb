# frozen_string_literal: true

class AccountsController < ApplicationController
  def search
    @accounts = Account.search(params[:username], params[:sns])
  end

  def index
    @account = Account.all

    @account = @account.search(params[:username], params[:sns])
  end

  def show
    @account = Account.find(params[:id])
    @comments = @account.comments
  end

  def destroy; end

  def update; end

  private

  def account_params
    params.require(:account).permit(:sns, :username, :name)
  end
end
