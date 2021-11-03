# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def blacklisted?(ip)
    return true if Comment.find_by(ip: ip, blacklist: 1)
    false
  end

  def block_blacklisted_hosts
    redirect_to page_path('access_denied') if blacklisted?(request.remote_ip)
  end
end
