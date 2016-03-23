class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :'/recipe/new'
  end

  # create
  get '/recipes/new' do
    erb :'/recipe/new'
  end

  post '/recipes' do
    Recipe.find_or_create_by(params)
    @recipes = Recipe.all
    redirect to "/recipes/#{Recipe.last.id}"
  end

  # read
  get '/recipes' do
    @recipes = Recipe.all
    erb :'/recipe/index'
  end

  get '/recipes/:id' do
    @recipe = find_recipe_by_id
    erb :'/recipe/show'
  end

  # update
  get '/recipes/:id/edit' do
    @recipe = find_recipe_by_id
    erb :'/recipe/edit'
  end

  patch '/recipes/:id' do
    @recipe = find_recipe_by_id
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  # delete
  delete '/recipes/:id/delete' do
    @recipe = find_recipe_by_id
    @recipe.delete
    redirect to "/recipes/index"
  end

  private
  def find_recipe_by_id
    Recipe.find_by_id(params[:id])
  end
end
