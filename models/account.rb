# frozen_string_literal: true

require 'json'
require 'sequel'

module CodeNiceBlog
  # Models a Account
  class Account < Sequel::Model

    one_to_many :articles

    plugin :association_dependencies, articles: :destroy
    plugin :timestamps, update_on_create: true

    def to_h
        {
          type: 'account',
          id: id,
          name: name,
        }
    end
  
    def to_json(options = {})
      JSON(to_h, options)
    end
  end
end