require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    #binding.pry
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    rec = Recipe.create(name: params['name'], ingredients: params['ingredients'], cook_time: params['cook_time'])
    

    redirect '/recipes/'+rec.id.to_s
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @id = params[:id]
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :edit
  end

  patch '/recipes/:id' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.update(name: params['name'], ingredients: params['ingredients'], cook_time: params['cook_time'])
    recipe.save

    redirect '/recipes/'+params[:id].to_s
  end

  delete '/recipes/:id/delete' do
    session['deleted'] = Recipe.find_by_id(params[:id]).name
    Recipe.find(params[:id]).delete

    redirect '/recipes'
  end

end