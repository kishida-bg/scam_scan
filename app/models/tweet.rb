class Tweet < ApplicationRecord
  include TwitterService

  def self.obtain_tweet
    # クライアント情報を呼び出しAPIを叩く許可をもらう
    client = Authorization.init

    data = client.search("情報商材", result_type: "recent").take(5).collect do |tweet|
      {
        "image": "#{tweet.user.profile_image_url.to_s.sub('http', 'https')}",
        "name": "#{tweet.user.name}",
        "text": "#{tweet.full_text}",
        "tweet_link": "#{tweet.uri}"
      }
    end
    # render json: {tweet: data}
    # そもそもこの処理はなんなのか
  end
end