require "pry"
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do #INDEX
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do #NEW
    erb :new
  end

  post '/recipes' do #CREATE
    @recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do #SHOW
    @recipe = Recipe.find_by_id(params[:id])
    #binding.pry
    erb :show
  end

  get '/recipes/:id/edit' do #PATCH
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    #binding.pry
    @recipe.delete
    redirect "/recipes"
  end
end