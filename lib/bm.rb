require 'sinatra/base'
require 'sinatra/form_helpers'
require 'data_mapper'
require 'dm-migrations'
require 'bcrypt'
require './lib/link.rb'
require './lib/user.rb'
require 'byebug'


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
    DataMapper::Model.raise_on_save_failure = true

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/sign_up' do
  	erb :sign_up
  end

  post '/dashboard' do
    @email = params[:email]
    @password = params[:password]
    @post = User.create(:email => @email, :created_at => Time.now)
    erb :dashboard

  end

  get '/add_link' do
    erb :add_link
  end

  post '/new_link' do
    @title = params[:title]
    @description = params[:description]
    @url = params[:url]
    @post = Link.create(:title => @title, :description => @description, :url => @url, :created_at => Time.now, :created_by => session[:email])
    erb :add_link

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
