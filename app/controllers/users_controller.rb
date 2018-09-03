class UsersController < ApplicationController

  # GET: /signup - route to create user
  get "/signup" do
    if logged_in?
      redirect to "/cases"
    else
      erb :"users/create_user"
    end
  end



  # POST: /signup - after signup form submission
  post "/signup" do
    if params[:email].empty? || params[:username].empty? || params[:password].empty?
      redirect to "/signup"
    else
      @user = User.create(:email => params[:email], :username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect "/cases"
    end
  end



  # GET: /login - route to login
  get "/login" do
    if logged_in?
      redirect to "/cases"
    else
      erb :"/users/login"
    end
  end



  # POST: /login - after login form submission
  post "/login" do
    if params[:username].empty? || params[:password].empty?
      redirect to "/login"
    else
      binding.pry
      @user = User.find(params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/cases"
      else
        redirect to "/login"
      end

    end
  end


  # GET: /logout
  get "/logout" do
    session.clear
    redirect to "/login"
  end



  # GET: /users/:id - route to show individual users
  get "/users/:id" do
    @user = User.find_by_id(params[:id])
    erb :"users/show"
  end



  # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
