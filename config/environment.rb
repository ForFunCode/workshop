# frozen_string_literal: true

require 'roda'
require 'econfig'

module CodeNiceBlog
  # Configuration for the API
  class Api < Roda
    plugin :environments
    
    extend Econfig::Shortcut
    Econfig.env = environment.to_s
    # this folder
    Econfig.root = '.'

    configure :development do
    #   # Allows running reload! in pry to restart entire app
    #   def self.reload!
    #     exec 'pry -r ./spec/test_load_all'
    #   end
      puts '--------'
      puts 'here is development'
      ENV['DATABASE_URL'] = 'sqlite://' + config.db_filename
      # puts config.db_filename
    end

    configure :test do
      # ENV['DATABASE_URL'] = 'sqlite://' + config.db_filename
      puts '--------'
      puts 'here is test'
    end

    configure :production do
      # Use Heroku's DATABASE_URL environment variable
      puts '--------'
      puts 'here is production'
    end

    configure do
      require 'sequel'
      DB = Sequel.connect(ENV['DATABASE_URL'])
      def self.DB
        DB
      end
      puts '--------'
      puts 'any'
    end
  end
end