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

    def initialize
      @base_uri = nil # have to be defined !
    end
  end
end
