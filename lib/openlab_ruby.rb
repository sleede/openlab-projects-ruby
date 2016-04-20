require 'openlab_ruby/version'
require 'openlab_ruby/client'
require 'openlab_ruby/projects'

module OpenlabRuby
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
