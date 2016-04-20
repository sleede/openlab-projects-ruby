require 'httparty'

module OpenlabRuby
  class Client
    include HTTParty
    attr_reader :app_secret
    format :json

    def initialize(app_secret: nil)
      @app_secret = app_secret || OpenlabRuby.config.app_secret
      app_secret = @app_secret

      self.class.base_uri OpenlabRuby.config.base_uri
      self.class.headers 'Accept' => 'application/json', 'Authorization' => "Token token=#{app_secret}"
    end

    def projects
      @projects ||= OpenlabRuby::Projects.new(self)
    end
  end
end
