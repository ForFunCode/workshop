# frozen_string_literal: true

require 'roda'

module CodeNiceBlog
  # Web API
  class Api < Roda
    plugin :json
    plugin :halt
    plugin :multi_route

    route do |routing|
      # GET / request
      response['Content-Type'] = 'application/json'
      routing.root do
        { 'message' => "CodeNiceBlog API v0.1 up in #{Api.environment} mode" }.to_json()
      end

      routing.on 'api' do
        routing.on 'v1' do
          @api_root = 'api/v1'
          routing.multi_route
        end
      end
    end
  end
end
