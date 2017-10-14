require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :'/recipes/new'
  end

  post '/recipes' do
    recipe = Recipe.new(
    name: params[:name], 
    ingredients: params[:ingredients], 
    cook_time: params[:cook_time]
    )
    recipe.save
    
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'/recipes/show'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :'/recipes/edit'
  end

  patch '/recipes/:id' do
    Recipe.update(
      params[:id], 
      name: params[:name], 
      ingredients: params[:ingredients],
      cook_time: params[:cook_time]
      )
    redirect "/recipes/#{params[:id]}"
  end

  delete '/recipes/:id/delete' do
    Recipe.find(params[:id]).destroy
    redirect '/recipes'
  end

end