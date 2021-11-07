class NaturalLanguageProcessingApi < ApplicationRecord
  def self.obtain_data
    language_service_client = Google::Cloud::Language.language_service version: :v1
    document = { content: 'hello world!', type: :PLAIN_TEXT }
    response = language_service_client.analyze_sentiment document: document

    sentiment = response.document_sentiment

    score = sentiment.score.to_f.round(1)
    magnitude = sentiment.magnitude.to_f.round(1)
    puts "Score: #{score}"
    puts "Magnitude: #{magnitude}"
  end
end
