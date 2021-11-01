class TwitterApi < ApplicationRecord
  include TwitterAccessAuthentication

  def self.obtain_sns_obj(username)
    # クライアント情報を呼び出しAPIを叩く許可をもらう
    client = Authorization.init

    begin
      twitter_user_obj ||= client.user(username)

      twitter_user_attributes = {
        "profile_image_url_https": twitter_user_obj.profile_image_url_https.to_s,
        "name": twitter_user_obj.name.to_s,
        "screen_name": twitter_user_obj.screen_name.to_s,
        "description": twitter_user_obj.description.to_s,
        "followers_count": twitter_user_obj.followers_count.to_s.to_i.to_s(:delimited),
        "url": twitter_user_obj.url.to_s
      }
    rescue Twitter::Error::NotFound
      nil
    end
  end
end
