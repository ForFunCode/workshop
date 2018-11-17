require 'roda'

module CodeNiceBlog

  class Api < Roda
    route('account') do |routing|
      @account_route = "#{@api_root}/account"
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
