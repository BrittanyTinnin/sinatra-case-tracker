class UsersController < ApplicationController

  # GET: /signup - route to create user
  get "/signup" do
    if logged_in?
      redirect to "/cases"
    else
      erb :"users/create_user"
    end
  end

  # POST: /signup
  post "/signup" do
    if params[:email].empty? || params[:username].empty? || params[:password].empty?
      redirect to "/signup"
    else
      user = User.create(:email => params[:email], :username => params[:username], :password => params[:password])
      session[:user_id] = user.id
      redirect "/cases"
  end


  # GET: /login
  get "/login" do
    if logged_in?
      redirect to "/cases"
    else
      erb :"/users/login"
  end

  #   POST: /login
  post "/login" do
    if params[:username].empty? || params[:password].empty?
      redirect to "/login"
    else
      user = User.find(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to "/cases"
      else
        redirect to "/login"
      end
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
