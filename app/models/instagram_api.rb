class InstagramApi < ApplicationRecord
  class << self
    def obtain_sns_obj(username)
      # HACK:引数をインスタンス変数化するとか絶対ダメな気がするから直したい
      @username = username.strip

      begin
        user_attributes = {
          "img": img,
          "name": name,
          "username": username,
          "description": description,
          "followers_count": followers_count,
          "url": url
        }
      rescue OpenURI::HTTPError
        nil
      end
    end

    def doc
      link = "https://dumpor.com/v/#{@username}"
      @doc = Nokogiri::HTML(URI.open(link))
    end

    def name
      doc.css('h1').text
    end

    def username
      doc.css('h4').text
    end

    def description
      doc.css('.user__info-desc').text
    end

    def followers_count
      doc.xpath('//*[@id="user-page"]/div[3]/div/div[2]/ul/li[2]').text.gsub(/[^\d]/, '').to_i.to_s(:delimited)
    end

    def img
      doc.css('.user__img').attr('style').text[/'(.*?)'/, 1]
    end

    def url
      "https://www.instagram.com/#{@username}/"
    end
  end
end
