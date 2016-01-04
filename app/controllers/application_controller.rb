class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Index Action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # New Action
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # Show Action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end 

  # Update Action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  post '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  # Destroy Action
  post '/recipes/:id/delete' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.delete
    redirect '/recipes'
  end
end