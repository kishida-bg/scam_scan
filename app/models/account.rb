class Account < ApplicationRecord
  def self.search(username, sns)
    if username && sns
      Account.find_or_create_by(username: username, sns: sns)
    end
  end
end