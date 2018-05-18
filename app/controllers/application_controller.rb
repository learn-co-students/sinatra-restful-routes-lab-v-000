class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Index Page
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # Create Page
  get '/recipes/new' do
    erb :new
  end

  # Create Recipe Action
  post '/recipes' do
    recipe = Recipe.create(params)
    redirect to "/recipes/#{recipe.id}"
  end

  # Show Page
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # Edit Page
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # Edit Recipe Action
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  # Delete Recipe Action
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete  # Delete vs Destroy = https://stackoverflow.com/questions/22757450/difference-between-destroy-and-delete
    redirect to '/recipes'
  end

end
