# frozen_string_literal: true

class Account < ApplicationRecord
  def self.search(username)
    if username
      Account.where(['username LIKE ?', "%#{username}%"])
    else
      Account.all
    end
  end
end
