require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end


  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :display_one
  end

  get '/recipes/:id/edit' do

    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
## delete
  delete '/recipes/:id/delete' do
    Recipe.delete(params[:id])
    redirect '/recipes'
  end
## update
  patch '/recipes/:id/edit' do

    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end
##add new
  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cooktime])
    redirect to "/recipes/#{@recipe.id}"
  end
end
