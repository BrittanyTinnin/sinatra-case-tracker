require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "secret"
    enable :sessions
    register Sinatra::ActiveRecordExtension


  end

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
