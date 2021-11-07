class NaturalLanguageProcessingApi < ApplicationRecord
  include GoogleCloudPlatformAccessAuthentication

  def self.obtain_data
    client = Authorization.init

    document = { content: 'hello world!', type: :PLAIN_TEXT }
    response = client.analyze_sentiment document: document

    sentiment = response.document_sentiment

    score = sentiment.score.to_f.round(1)
    magnitude = sentiment.magnitude.to_f.round(1)
    puts "Score: #{score}"
    puts "Magnitude: #{magnitude}"
  end
end
