require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/recipes' do
     @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :"recipes/new"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/edit"
  end

  post '/recipes' do #'/recipes/new'
    recipe = Recipe.create(name:params[:name],ingredients:params[:ingredients],cook_time:params[:cook_time])
    redirect to "/recipes/#{recipe.id}"
  end

  patch '/recipes/:id/edit' do
    recipe = Recipe.find(params[:id])
    recipe.update(name:params[:name],ingredients:params[:ingredients],cook_time:params[:cook_time])
    redirect to "/recipes/#{params[:id]}"
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect to "/recipes"
  end


end
