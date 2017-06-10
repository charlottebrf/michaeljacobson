require 'sinatra/base'
require 'thin'
require 'pony'
require 'sendgrid-ruby'

class Homepage < Sinatra::Base
  include SendGrid
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(20) }

  configure do
    Pony.options = {
      via: :smtp,
      via_options: {
        address: 'smtp.sendgrid.net',
        port: '587',
        user_name: ENV['SENDGRID_USERNAME'],
        password: ENV['SENDGRID_PASSWORD'],
        authentication: :plain,
        enable_starttls_auto: true
      }
    }
  end

  helpers do
    def send_email(name, email, message)
      Pony.mail to: 'michael.jacobson89@gmail.com',
                from: email,
                subject: "New message from #{name}",
                body: message
    end
  end

  get '/' do
    erb :index
  end

  get '/blog' do
    erb :blog
  end

  get '/contact' do
    erb :contact
  end

  get '/gallery' do
    erb :gallery
  end

  get '/links' do
    erb :links
  end

  get '/portfolio' do
    erb :portfolio
  end

  post '/contact/new' do
    send_email(params[:name], params[:email], params[:message])
    redirect '/'
  end

  run! if $PROGRAM_NAME == __FILE__
end