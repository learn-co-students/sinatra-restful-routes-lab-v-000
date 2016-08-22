class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do #home page
    erb :index
  end
#-----------------CREATE-----------------
  get '/recipes/new' do #load create form
    erb :new
  end

  post '/recipes' do #create action
    @recipe = Recipe.create(
    name: params[:name],
    ingredients: params[:ingredients],
    cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

#-----------------READ-----------------

  get '/recipes/:id' do #shows all recipes
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes' do #shows all recipes
    @recipes = Recipe.all
    erb :index
  end

#-----------------UPDATE-----------------

  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #edit action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

#-----------------DELETE-----------------

  delete '/recipes/:id/delete' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end
end
