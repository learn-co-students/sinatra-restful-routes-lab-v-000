class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :home
  end

  # create
  get '/recipes/new' do
    erb :'recipe/new'
  end

  post '/recipes' do
    Recipe.find_or_create_by(params)
    @recipes = Recipe.all
    redirect to "/recipes/#{Recipe.last.id}"
  end

  # read
  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipe/index'
  end

  get '/recipes/:id' do
    @recipe = find_recipe_by_id
    erb :'recipe/show'
  end

  # update
  get '/recipes/:id/edit' do
    @recipe = find_recipe_by_id
    erb :'recipe/edit'
  end

  patch '/recipes/:id' do
    recipe = find_recipe_by_id
    binding.pry
    recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
    # erb :'recipe/show'
  end

  # delete
  get '/recipes/:id/delete' do
    find_recipe_by_id.delete
  end

  private
  def find_recipe_by_id
    Recipe.find_by_id(params[:id])
  end
end
