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


  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
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
