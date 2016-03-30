class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/recipes"
  end

  get '/recipes/new' do 
    erb :new
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  post '/recipes' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{recipe.id}"
  end

  patch '/recipes/:id' do 
    recipe = Recipe.find_by(id: params[:id])
    recipe.update(name: params[:recipe_name], ingredients: params[:ingredients_names], cook_time: params[:cook_time])
    redirect to "/recipes/#{recipe.id}"
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
end