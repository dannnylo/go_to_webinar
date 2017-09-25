module GoToWebinar
  class Client
    attr_accessor :url, :organizer_key, :access_token

    def initialize(access_token:, organizer_key: , url: nil)
      @url = url || default_url
      @organizer_key = organizer_key
      @access_token = access_token
    end

    def default_url
      'https://api.getgo.com/G2W/rest'
    end

    def headers
      {
        'Accept' => 'application/json',
        'Authorization' => "OAuth oauth_token=#{access_token}"
      }
    end

    def get(path, data = {})
      response = RestClient.get(url + path, data.merge(headers))
      JSON.parse(response.body)
    end

    def post(path, data)
      response = RestClient.post(url + path, data, headers)
      JSON.parse(response.body)
    end

    def put(path, data)
      response = RestClient.put(url + path, data, headers)
      JSON.parse(response.body)
    end

    def delete
    end
  end
end
