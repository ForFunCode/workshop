# frozen_string_literal: true

require 'roda'
require 'econfig'

module CodeNiceBlog
  # Configuration for the API
  class Api < Roda
    plugin :environments

    # extend Econfig::Shortcut
    # environment  # => :development
    # Econfig.env = environment.to_s
    # # this folder
    # Econfig.root = '.'

    configure :development do
    #   # Allows running reload! in pry to restart entire app
    #   def self.reload!
    #     exec 'pry -r ./spec/test_load_all'
    #   end
      # puts config.db_filename
      # puts config.gh_token
      puts 'here is development'
    end

    configure :test do
      # ENV['DATABASE_URL'] = 'sqlite://' + config.db_filename
    #   ENV['DATABASE_URL'] = 'sqlite://' + config.db_filename
      puts 'here is test'
    end

    configure :production do
      # Use Heroku's DATABASE_URL environment variable
      puts 'here is production'
    end

    configure do
      # require 'sequel'
      # DB = Sequel.connect(ENV['DATABASE_URL'])
      # def self.DB
      #   DB
      # end
      puts 'here is whereever will do'
    end
  end
end