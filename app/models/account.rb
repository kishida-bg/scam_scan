class Account < ApplicationRecord
  def self.search(username, sns)
    if username && sns
      account = Account.find_or_initialize_by(username: username, sns: sns)
      if account.new_record?
        account.save!
        account
      else
        account.increment!(:searched_count, 1)
      end
    end
  end
end
