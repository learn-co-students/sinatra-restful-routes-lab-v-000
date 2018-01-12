require "./config/environment"

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
    # binding.pry
    erb :'recipes/display_recipes'
  end

  get '/recipes/new' do
    erb :'recipes/new'
  end

  get '/recipes/:id' do
    @r = Recipe.find_by_id(params[:id])
    erb :'recipes/recipe'
  end

  get '/recipes/:id/edit' do
    @r = Recipe.find_by_id(params[:id])
    erb :'recipes/edit'
  end

  patch '/recipes/:id' do
    r = Recipe.find_by_id(params[:id])
    r.name = params[:name]
    r.ingredients = params[:ingredients]
    r.cook_time = params[:cook_time]
    r.save

    redirect "/recipes/#{r.id}"
  end

  post '/recipes' do
    r = Recipe.new
    r.name = params[:name]
    r.ingredients = params[:ingredients]
    r.cook_time = params[:cook_time]
    r.save

    redirect "/recipes/#{r.id}"
  end

  delete '/recipes/:id/delete' do
    r = Recipe.find_by_id(params[:id])
    r.delete
    redirect '/recipes'
  end
end
