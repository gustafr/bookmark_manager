require 'sinatra/base'

class BookmarkManager < Sinatra::Base
	set :views, proc {File.join(root, '..', 'views')}
  	enable :sessions
  	set :session_secret, '123321123'
  	use Rack::Session::Pool 
  get '/' do
    'Hello BookmarkManager!'
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
