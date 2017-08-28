class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # root => index
  get '/' do
    erb :index
  end

  # index action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #new action
  #1. display new template
  get '/recipes/new' do
    erb :new
  end

  #2.create new recipe
  post '/recipes' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  # edit action
  #1. display edit template
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #2. update recipes
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end

  # show action
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # delete action
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end
