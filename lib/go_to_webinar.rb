require 'rest-client'
require 'json'
require "go_to_webinar/version"
require "go_to_webinar/configuration"
require "go_to_webinar/client"
require "go_to_webinar/webinar"

module GoToWebinar
  class << self
    attr_accessor :client, :configuration

    def client
      @client ||= GoToWebinar::Client.new
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def setup
      yield(configuration)
      @client = nil
    end
  end
end
