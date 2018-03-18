# Routing
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  get '/recipes/new' do
    erb :'recipes/new'
  end

  post '/recipes' do
    recipe = Recipe.create(name: params[:name],
                           cook_time: params[:cook_time],
                           ingredients: params[:ingredients])
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/show'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/edit'
  end

  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.name = params[:name]
    recipe.cook_time = params[:cook_time]
    recipe.ingredients = params[:ingredients]
    recipe.save
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect '/recipes'
  end

  get '/' do
    erb :index
  end
end
