# frozen_string_literal: true

class Comment < ApplicationRecord
  include GoogleCloudPlatformAccessAuthentication

  belongs_to :account
  before_save :save_sentiment_analysis

  def save_sentiment_analysis
    client = Authorization.init

    body = read_attribute(:body)
    document = { content: body, type: :PLAIN_TEXT }
    response = client.analyze_sentiment document: document

    sentiment = response.document_sentiment

    score = sentiment.score.to_f.round(1)
    magnitude = sentiment.magnitude.to_f.round(1)

    write_attribute(:score, score)
    write_attribute(:magnitude, magnitude)
  end
end
