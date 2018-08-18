require './config/environment'

class ApplicationController < Sinatra::Base
  # register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #loads new form
  get '/recipes/new' do
    erb :new
  end

  #loads index page
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #loads show page
  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  #loads edit form
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  #updates a recipe
  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  #creates a recipe
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #delete action
  delete '/recipes/:id/delete' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipes'
  end
end
