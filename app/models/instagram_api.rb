class InstagramApi < ApplicationRecord
  class << self
    def obtain_sns_obj(username)
      doc ||= Nokogiri::HTML(URI.open("https://dumpor.com/v/#{username.strip}"))

      {
        "img": img(doc),
        "name": name(doc),
        "username": username(doc),
        "description": description(doc),
        "followers_count": followers_count(doc),
        "url": url(username)
      }
    rescue OpenURI::HTTPError
      nil
    end

    private

    def name(doc)
      doc.css('h1').text
    end

    def username(doc)
      doc.css('h4').text
    end

    def description(doc)
      doc.css('.user__info-desc').text
    end

    def followers_count(doc)
      doc.xpath('//*[@id="user-page"]/div[3]/div/div[2]/ul/li[2]').text.gsub(/[^\d]/, '').to_i.to_s(:delimited)
    end

    def img(doc)
      doc.css('.user__img').attr('style').text[/'(.*?)'/, 1]
    end

    def url(username)
      "https://www.instagram.com/#{username}/"
    end
  end
end
