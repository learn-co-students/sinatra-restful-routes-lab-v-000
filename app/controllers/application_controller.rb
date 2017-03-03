require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes/new' do
    @recipe = Recipe.create(params)
    recipeID = @recipe.id.to_s
    redirect to('/recipes/' + recipeID)
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id/edit' do
    Recipe.update(params[:id], :name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to('/recipes/' + params[:id].to_s)
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do
    Recipe.delete(params[:id])
    redirect to('/recipes')
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end


end
