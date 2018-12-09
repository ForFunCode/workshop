require 'roda'

module CodeNiceBlog

  class Api < Roda
    route('mailer') do |routing|
        @account_route = "#{@api_root}/mailer"
        routing.on "account" do 
            routing.mail "added" do |account|
               @account = account
               puts @account
               from 'ipt08110320@gmail.com'
               to 'victorlin12345@gmail.com'
               subject 'Account Added'

               html_part render('account_added.txt')
            end
        end   
    end
  end
end