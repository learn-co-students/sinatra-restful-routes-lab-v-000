class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes' do
    #show all recipes
    @recipes = Recipe.all
    erb :recipes
  end
  
  get '/recipes/new' do
    erb :new
  end
  
  post '/recipes' do
    hash = {name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time]}
    recipe = Recipe.create hash
    redirect to "/recipes/#{recipe.id}"
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find params[:id]
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find params[:id]
    erb :edit
  end
  
  patch '/recipes/:id' do
    recipe = Recipe.find params[:id]
    recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to '/recipes/#{recipe.id}' 
  end
  
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find params[:id]
    @recipe.delete
    # erb :recipes
    redirect to '/recipes'
  end
  
end 