module GoogleCloudPlatformAccessAuthentication
  extend ActiveSupport::Concern
  class Authorization
    def self.init
      Google::Cloud::Language.language_service version: :v1
    end
  end
end