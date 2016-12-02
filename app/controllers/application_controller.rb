class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect to '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:recipe_name], ingredients: params[:recipe_ingredients], cook_time: params[:recipe_cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe
      erb :show
    else
      'Cannot Find That Recipe'
      redirect to '/recipes'
    end
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.delete
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.name = params[:recipe_name]
    recipe.ingredients = params[:recipe_ingredients]
    recipe.cook_time = params[:recipe_cook_time]
    recipe.save
    redirect  "/recipes/#{recipe.id}"
  end

end
