# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :block_blacklisted_hosts, only: [:show]

  def index
    @account = Account.search_or_create_account(params[:username], params[:sns])
    redirect_to account_path(@account.id) if @account
  end

  def show
    @account = Account.find(params[:id])
    @comments = Comment.where(account_id: params[:id])
    # HACK: コントローラーにロジックかきたくない
    @twitter_user_obj = TwitterApi.obtain_sns_obj(@account.username) if @account.sns == 'Twitter'
    @instagram_user_obj = InstagramApi.obtain_sns_obj(@account.username) if @account.sns == 'Instagram'
  end

  private

  def account_params
    params.require(:account).permit(:sns, :username)
  end
end
