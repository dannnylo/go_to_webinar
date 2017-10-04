module GoToWebinar
  # Configuration class
  class Configuration
    attr_accessor :organizer_key, :access_token, :url, :client

    def initialize
      @url = Configuration.default_url
    end

    def self.default_url
      'https://api.getgo.com/G2W/rest'
    end
  end
end
