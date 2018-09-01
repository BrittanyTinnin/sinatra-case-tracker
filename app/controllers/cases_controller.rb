class CasesController < ApplicationController

  # GET: /cases
  get "/cases" do
    erb :"/cases/index.html"
  end

  # GET: /cases/new
  get "/cases/new" do
    erb :"/cases/new.html"
  end

  # POST: /cases
  post "/cases" do
    redirect "/cases"
  end

  # GET: /cases/5
  get "/cases/:id" do
    erb :"/cases/show.html"
  end

  # GET: /cases/5/edit
  get "/cases/:id/edit" do
    erb :"/cases/edit.html"
  end

  # PATCH: /cases/5
  patch "/cases/:id" do
    redirect "/cases/:id"
  end

  # DELETE: /cases/5/delete
  delete "/cases/:id/delete" do
    redirect "/cases"
  end
end
