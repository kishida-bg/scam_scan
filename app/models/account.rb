class Account < ApplicationRecord
  def self.search(username, sns=nil)
    if username && sns
      Account.find_or_create_by(username: username, sns: sns)
    else
      Account.all
    end
  end
end