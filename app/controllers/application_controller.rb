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
    erb :'/recipes/index'
  end

  get '/recipes/new' do 
    erb :'/recipes/new'
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipes/show'
  end


  post '/recipes' do 
    @recipe = Recipe.new
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end


  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipes/edit'
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cooktime = params[:cook_time]
    @recipe.save
    redirect to '/recipes/#{@recipe.id}'
  end

  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end