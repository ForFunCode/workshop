# frozen_string_literal: true

require 'sequel'
Sequel.migration do
  change do
    create_table(:articles) do
      primary_key :id
      
      Integer :type, default: 0
      String  :content, null: false
      Integer :account_id
      
      DateTime :created_at
      DateTime :updated_at
            
            foreign_key [:account_id], table: :accounts
        end
    end
end