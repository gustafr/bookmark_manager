require 'sinatra/base'
require './lib/link.rb'

class BookmarkManager < Sinatra::Base
	set :views, proc {File.join(root, '..', 'views')}
  	enable :sessions
  	set :session_secret, '123321123'
  	use Rack::Session::Pool

  get '/' do
    @links = Link.get_links
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
