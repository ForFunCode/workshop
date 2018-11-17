# frozen_string_literal: true
require_relative '../models/account'

module CodeNiceBlog
  class RegisterAccount
    def self.call(account)
      CodeNiceBlog::Account.create(account)
    end
  end
end