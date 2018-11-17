# frozen_string_literal: true

require 'roda'

module CodeNiceBlog
  # Web API
  class Api < Roda
    plugin :json
    plugin :halt

    route do |routing|
      # GET / request
      routing.root do
        { 'message' => "CodeNiceBlog API v0.1 up in #{Api.environment} mode" }.to_json()
      end

      routing.on 'account' do

        routing.on 'user' do
          routing.on String do |id|
            routing.get do
              Account.where(id: id).first.to_json
            end
          end
        end

        routing.get do
          CodeNiceBlog::Account.create({name:'家瑋'})
          CodeNiceBlog::Account.create({name:'文慶'})
          CodeNiceBlog::Account.all.to_json()
        end
      end

    end
  end
end
