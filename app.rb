require 'sinatra/base'

class Homepage < Sinatra::Base

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

  run! if $PROGRAM_NAME == __FILE__
end