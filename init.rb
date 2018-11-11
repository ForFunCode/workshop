# frozen_string_literal: true

require_relative 'app.rb'

folders = %w[config]
folders.each do |folder|
  require_relative "#{folder}/init.rb"
end
