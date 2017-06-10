require 'sinatra/base'
require 'thin'
require 'pony'

class Homepage < Sinatra::Base
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(20) }

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