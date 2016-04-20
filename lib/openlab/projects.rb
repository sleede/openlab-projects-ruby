module Openlab
  class Projects
    PROJECTS_PATH = '/projects'

    attr_accessor :client

    def initialize(client = nil)
      @client = client || Openlab::Client.new
    end

    def search(q, opts = {})
      client.get(PROJECTS_PATH, query: { q: q }.merge(opts))
    end

    def create(attributes)
      client.post(PROJECTS_PATH, body: { project: attributes })
    end

    def update(id, attributes)
      client.patch("#{PROJECTS_PATH}/#{id}", body: { project: attributes })
    end

    def destroy(id)
      client.delete("#{PROJECTS_PATH}/#{id}")
    end
  end
end
