# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def blacklisted?(ip)
    Comment.exists?(ip: ip, blacklist: 1)
  end

  def block_blacklisted_hosts
    redirect_to page_path('access_denied') if blacklisted?(request.remote_ip)
  end
end
