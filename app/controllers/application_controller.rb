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

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    Recipe.create(params)
    @recipe = Recipe.all
    # erb :index
    redirect "/recipes/#{Recipe.all.last.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show 
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    # redirect '/show'
    erb :edit
  end 

  patch '/recipes/:id' do 
    # binding.pry
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name])
    @recipe.update(ingredients: params[:ingredients])
    # @recipe.update(cook_time: params[:cook_time])
    # @recipe.update(cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
    # binding.pry 
  end

  delete '/recipes/:id/delete' do 
    @recipe = Recipe.find_by_id(params[:id]) 
    @recipe.delete
    redirect "/recipes"
  end 

end 



