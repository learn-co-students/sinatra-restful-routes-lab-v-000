class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Display index page with all recipes
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # Render new recipe form
  get '/recipes/new' do
    erb :new
  end

  # Save new recipe to database
  post '/recipes' do
    @recipe  = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  # Display single recipe
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  # Render new edit form
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  # Updates a single recipe
  post '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  # Deletes a single recipe
  post '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
