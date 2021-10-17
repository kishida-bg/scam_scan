# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :comments

  enum sns: { Instagram: 1, Twitter: 2, LINE: 3 }

  # アカウントIDで検索し、該当データがなければ新規作成し、存在するならば検索された回数を+1する
  def self.search_or_create_account(username, sns)
    if username && sns
      account = Account.find_or_initialize_by(username: username, sns: sns)
      if account.new_record?
        account.save!
        # ↓これがないと戻り値がインスタンスではなくtrueになってしまう
        account
      else
        account.increment!(:searched_count, 1)
      end
    end
  end
end
