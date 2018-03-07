require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # CREATE =========================

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.create(params)
    redirect "recipes/#{recipe.id}"
  end

  # READ =========================

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # UPDATE =========================

  # post 'recipes/:id/edit' do
  #   @recipe = Recipe.find(params[:id])
  #   redirect "recipes/#{recipe.id}/edit"
  # end

  get 'recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch 'recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    erb :show
  end

  # DELETE =========================

  delete 'recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect '/'
  end
end
