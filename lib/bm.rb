require 'sinatra/base'
require 'sinatra/form_helpers'
require 'data_mapper'
require './lib/link.rb'



class BookmarkManager < Sinatra::Base
	helpers Sinatra::FormHelpers
	set :views, proc {File.join(root, '..', 'views')}
  	enable :sessions
  	set :session_secret, '123321123'
  	use Rack::Session::Pool
    env = ENV['RACK_ENV'] || "development"

    DataMapper.setup(:default, "postgres://localhost/bm_#{env}")
    DataMapper.finalize
    DataMapper.auto_upgrade!

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/sign_up' do
  	erb :sign_up
  end

  post '/dashboard' do
    erb :dashboard
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
