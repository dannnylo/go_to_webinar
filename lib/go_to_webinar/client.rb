module GoToWebinar
  class Client
    attr_accessor :url, :adapter
    def initialize(url: nil, adapter: nil)
      @url = url || default_url
      @adapter = nil || default_adapter
    end

    def default_url
      'https://api.getgo.com/G2W/rest'
    end

    def default_adapter
      Faraday.default_adapter
    end

  end
end
