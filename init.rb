# frozen_string_literal: true

folders = %w[config models controllers]
folders.each do |folder|
  require_relative "#{folder}/init.rb"
end
