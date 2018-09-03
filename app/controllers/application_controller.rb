require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "secret"
    use Rack::Flash
    enable :sessions
    register Sinatra::ActiveRecordExtension

  end

  # flash[:notice] = "You can stop rolling your own now."


  get "/" do
    erb :homepage
  end
  
  helpers do

    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!session[:user_id]
    end

  end
  
end
