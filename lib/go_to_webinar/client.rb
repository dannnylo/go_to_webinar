module GoToWebinar
  class Client
    attr_accessor :url, :organizer_key, :access_token

    def initialize(access_token: nil, organizer_key: nil, url: nil)
      config = GoToWebinar.configuration
      @url = url || config.url
      @organizer_key = organizer_key || config.organizer_key
      @access_token = access_token || config.access_token
    end

    def headers
      {
        'Accept' => 'application/json',
        'Authorization' => "OAuth oauth_token=#{access_token}"
      }
    end

    def get(path, data = {})
      response = RestClient.get(make_path(path), data.merge(headers))
      JSON.parse(response.body)
    end

    def post(path, data)
      response = RestClient.post(make_path(path), data, headers)
      JSON.parse(response.body)
    end

    def put(path, data)
      response = RestClient.put(make_path(path), data, headers)
      JSON.parse(response.body)
    end

    def delete
      response = RestClient.delete(make_path(path), data, headers)
      JSON.parse(response.body)
    end

    def make_path(path)
      path.gsub!(':organizer_key:', organizer_key)
      "#{url}#{path}"
    end
  end
end
