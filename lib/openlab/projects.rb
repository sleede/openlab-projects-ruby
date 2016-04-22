module Openlab
  class Projects
    PROJECTS_PATH = '/projects'

    attr_accessor :client

    def initialize(client = nil)
      @client = client || Openlab::Client.new
    end

    def search(q, opts = {})
      client.get(path, query: { q: q }.merge(opts))
    end

    def create(attributes)
      client.post(path, body: { project: attributes })
    end

    def update(id, attributes)
      client.patch("#{path}/#{id}", body: { project: attributes })
    end

    def destroy(id)
      client.delete("#{path}/#{id}")
    end

    private
      def path
        "#{Openlab.config.api_version_path}#{PROJECTS_PATH}"
      end
  end
end
