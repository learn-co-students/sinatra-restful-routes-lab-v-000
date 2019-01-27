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
    erb :new
  end

  post '/recipes/new' do

  end

  get '/recipes/:id' do
      if Recipe.find_by(id: params[:id])
        @recipe = Recipe.find_by(id: params[:id])
        erb :show
      else
        redirect to '/recipes'
      end

  end

  delete '/recipes/:id' do

    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'

  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end


  patch '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.cook_time = params[:cook_time]
    @recipe.ingredients = params[:ingredients]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end


end
