class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  ####################
  #  'INDEX' ACTION  #
  ####################

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  ####################
  #   'NEW' ACTION   #
  ####################

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  ####################
  #   SHOW ACTION    #
  ####################

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  ####################
  #   EDIT ACTION    #
  ####################

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    new_attr = {name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time]}
    @recipe.update(new_attr)

    redirect to "/recipes/#{@recipe.id}"
  end

  ####################
  #  DELETE ACTION   #
  ####################

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end



end