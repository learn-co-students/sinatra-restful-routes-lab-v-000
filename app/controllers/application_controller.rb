require './config/environment'

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
    erb :new_recipe
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show_recipe
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit_recipe
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe[:name] = params[:name]
    @recipe[:ingredients] = params[:ingredients]
    @recipe[:cook_time] = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end


  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end
