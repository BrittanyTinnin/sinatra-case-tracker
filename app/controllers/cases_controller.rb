class CasesController < ApplicationController

  # GET: /cases
  get "/cases" do
    redirect to "/login" unless logged_in?
    @user = current_user
    @cases = Case.all
    erb :"cases/index"
  end

  # GET: /cases/new
  get "/cases/new" do
    redirect to "/login" unless logged_in?
    erb :"/cases/new"
  end

  # POST: /cases
  post "/cases" do
    if !logged_in?
      redirect to "/login"
    else
      if params[:content].empty?
        redirect to "/cases/new"
      else
        user = User.find(session[:user_id])
        user.cases.create(content: params[:content])
        redirect "/cases"
      end
    end
  end

  # GET: /cases/5
  get "/cases/:id" do
    redirect to "/login" unless logged_in?
    @case = Case.find(params[:id])
    erb :"/cases/show"
  end

  # GET: /cases/5/edit
  get "/cases/:id/edit" do
    redirect to "/login" unless logged_in?
    @case = Case.find(params[:id])
    erb :"/cases/edit"
  end

  # PATCH: /cases/5
  patch "/cases/:id" do
    @case = Case.find(params[:id])
    if params[:content].empty?
      redirect "/cases/#{@case.id}/edit"
    else
      @case.update(content: params[:content])
      @case.save
      redirect to "/cases/#{@case.id}"
    end
  end

  # DELETE: /cases/5/delete
  delete "/cases/:id/delete" do
    if logged_in?
      @case = Case.find(params[:id])
      if @case.user == current_user
         @case.destroy
      else
          redirect '/cases'
      end
    else
        redirect '/login'
    end"
  end

end
