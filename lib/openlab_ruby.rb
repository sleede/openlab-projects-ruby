require 'openlab/version'
require 'openlab/client'
require 'openlab/projects'

module Openlab
  class << self
    attr_accessor :config

    def config
      @config ||= Config.new
    end
  end

  def self.configure
    yield config
  end

  class Config
    attr_accessor :app_secret, :base_uri
    attr_reader :api_version_path

    def initialize
      @base_uri = 'https://openprojects.fab-manager.com'
      @api_version_path = '/api/v1'
    end
  end
end
