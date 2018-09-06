
class CasesController < ApplicationController
  use Rack::Flash

  # GET: /cases
  get "/cases" do
    redirect to "/login" unless logged_in?
    @user = current_user
    @cases = @user.cases
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
      if params[:content].empty? || params[:title].empty?
        redirect to "/cases/new"
      else
        user = User.find(session[:user_id])
        user.cases.create(title: params[:title], content: params[:content])
        flash[:alert] = "new case submitted"
        redirect "/cases"
      end
    end
  end

  # GET: /cases/5
  get "/cases/:id" do
    redirect to "/login" unless logged_in?
    @case = Case.find(params[:id])
    redirect to "/cases" if @case.user != current_user 
    erb :"/cases/show"
  end

  # GET: /cases/5/edit
  get "/cases/:id/edit" do
    redirect to "/login" unless logged_in?
    @case = Case.find(params[:id])
    redirect to "/cases" unless authorize
    erb :"/cases/edit"
  end

  # PATCH: /cases/5
  patch "/cases/:id" do
    @case = Case.find(params[:id])
    if params[:content].empty?
      redirect "/cases/#{@case.id}/edit"
    else
      @case.update(title: params[:title], content: params[:content])
      @case.save
      flash[:alert] = "updated case"
      redirect to "/cases/#{@case.id}"
    end
  end

  # DELETE: /cases/5/delete
  delete "/cases/:id/delete" do
    if logged_in?
      @case = Case.find(params[:id])
      redirect to "/cases" unless authorize 
      @case.destroy
      flash[:alert] = "case deleted"
      redirect '/cases'
    else
        redirect '/login'
    end
  end

end
