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

    DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bm_#{env}")
    DataMapper.finalize
    DataMapper.auto_upgrade!
    DataMapper::Model.raise_on_save_failure = true

    def is_user?
      @user != nil
    end

  before do

    @user = User.get(session[:user_id]) unless is_user?
  end

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/sign_up' do
  	erb :sign_up
  end

  post '/sign_up' do
    begin
      @email = params[:email]
      @password = params[:password]
      @password_confirmation = params[:password_confirmation]
      @user = User.create(:email => @email, :password => @password, :password_confirmation => @password_confirmation, :created_at => Time.now)
      redirect '/dashboard'
    rescue
      redirect 'sign_up'
    end

  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    if
      
      @user = User.authenticate(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      redirect 'sign_in'
    end

  end

  get '/dashboard' do
    erb :dashboard
  end

  get '/add_link' do
    if session[:user_id] == nil
      redirect '/sign_in'
    else
      erb :add_link
    end
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
