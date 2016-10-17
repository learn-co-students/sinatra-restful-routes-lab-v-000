require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipes
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = current_recipe
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = current_recipe
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = current_recipe
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = current_recipe
    @recipe.destroy
    redirect '/recipes'
  end

  helpers do
    def current_recipe
      Recipe.find(params[:id])
    end
  end
end
