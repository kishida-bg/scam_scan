# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :comments

  enum sns: { Instagram: 1, Twitter: 2, LINE: 3 }

  def self.search(username, sns)
    if username && sns
      account = Account.find_or_initialize_by(username: username, sns: sns)
      if account.new_record?
        account.save!
      else
        account.increment!(:searched_count, 1)
      end
    end
  end
end
