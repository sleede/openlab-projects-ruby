require 'httparty'

module Openlab
  class Client
    include HTTParty
    default_timeout 5
    attr_reader :app_secret
    format :json

    def initialize(app_secret: nil)
      @app_secret = app_secret || Openlab.config.app_secret

      self.class.default_options[:verify] = Openlab.config.httparty_verify
      self.class.default_options[:verify_peer] = Openlab.config.httparty_verify_peer
      self.class.base_uri Openlab.config.base_uri
      self.class.headers 'Accept' => 'application/json', 'Authorization' => "Token token=#{@app_secret}"
    end

    def projects
      @projects ||= Openlab::Projects.new(self)
    end

    def method_missing(method_name, *arguments, &block)
      self.class.respond_to?(method_name) ? self.class.__send__(method_name, *arguments, &block) : super
    end

    def respond_to?(method_name, include_private = false)
      self.class.respond_to?(method_name) || super
    end
  end
end
