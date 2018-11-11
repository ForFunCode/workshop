# frozen_string_literal: true

require 'json'
require 'sequel'

module CodeNiceBlog
  # Models a Account
  class Article < Sequel::Model

    many_to_one :accounts

    plugin :timestamps, update_on_create: true

    def to_h
        {
          type: 'article',
          id: id,
          name: content,
        }
    end
  
    def to_json(options = {})
      JSON(to_h, options)
    end
  end
end