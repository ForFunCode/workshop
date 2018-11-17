# frozen_string_literal: true

require_relative 'app'
# 递归下面所有目录文件 **
Dir.glob("#{File.dirname(__FILE__)}/**/*.rb").each do |file|
  require file
end