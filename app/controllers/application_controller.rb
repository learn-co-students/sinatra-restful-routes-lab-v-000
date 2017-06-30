require "pry"
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect "/recipes"
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  get "/recipes/:id" do
    @r = Recipe.find_by(id: params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @r = Recipe.find_by(id: params[:id])
    erb :edit
  end

  post "/recipes" do
    @r = Recipe.create(params)
    redirect "recipes/#{@r.id}"
  end

  patch "/recipes/:id/edit" do
    @r = Recipe.find_by(id: params[:id])
    @r.name = params[:name]
    @r.ingredients = params[:ingredients]
    @r.cook_time = params[:cook_time]
    @r.save
    redirect "recipes/#{@r.id}"
  end

  delete "/recipes/:id/delete" do
    Recipe.delete(params[:id])
    redirect "/recipes"
  end
end
