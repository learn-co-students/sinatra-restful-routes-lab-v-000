require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :'index'
  end

  get '/recipes/new' do
    erb :'new'
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time] )
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'specific_recipe'
  end

  get '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    erb :'deleted'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'edit'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(params[:name])
    @recipe.update(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])

    redirect to ("/posts/#{@post.id}")
  end

end
