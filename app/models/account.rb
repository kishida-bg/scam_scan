class Account < ApplicationRecord
  def self.search(username, sns=nil)
    if username && sns
      Account.where(['username LIKE ?', "%#{username}%"]).where(sns: sns)
    else
      Account.all
    end
  end
end