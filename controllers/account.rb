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
      routing.post do
        begin
          account_data = JSON.parse(routing.body.read)
          puts account_data
          CodeNiceBlog::RegisterAccount.call(account_data)
          response.status = 201
          {'message': 'account created'}.to_json()
        rescue StandardError => error
          routing.halt 404, { message: error.message }.to_json
        end
      end
    end
  end
end
