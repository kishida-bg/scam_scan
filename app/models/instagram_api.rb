class InstagramApi < ApplicationRecord
  require 'open-uri' # URLにアクセスする為のライブラリを読み込みます。
  require 'nokogiri' # Nokogiriライブラリを読み込みます。

  class << self
    def instagram_user_attributes
      {
        img: img,
        name: name,
        description: description,
        followers_count: followers_count
      }
    end

    def doc
      link = 'https://dumpor.com/v/kahoseto06'
      @doc = Nokogiri::HTML(URI.open(link))
    end

    def name
      doc.css('h1').text
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
  end
end
