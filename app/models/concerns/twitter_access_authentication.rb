module TwitterAccessAuthentication
  extend ActiveSupport::Concern
  class Authorization
    def self.init
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_API_KEY"]
        config.consumer_secret     = ENV["TWITTER_API_SECRET_KEY"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_SECRET_TOKEN"]
      end
      return client
    end
  end
end

# concerns　→ APIを叩く許可などを切り出しておく
# extend ActiveSupport::Concernはモジュールを呼び出した時インスタンスメソッドもクラスメソッドも呼び出せる？