class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Retrieve
  get '/' do
    @all = Recipe.all
    erb :index
  end
  get '/index' do
    @all = Recipe.all
    erb :index
  end
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :recipe_show
  end

  # create
  get '/recipes/new' do
    erb :recipe_new
  end

  post '/recipes' do
    recipe = Recipe.new(name => params[:name], ingredients => params[:ingredients], cook_time => params[:cook_time])
    recipe.save
    redirect '/'
  end

  # update
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :recipe_edit if @recipe
    redirect '/index'
  end
  patch '/recipes/:id' do
     @recipe = Recipe.find_by_id(params[:id])
     @recipe.name=params[:name]
     @recipe.ingedients=params[:ingredients]
     @recipe.cook_time=params[:cook_time]
     @recipe.save
     erb :recipe_show   # alternatively, re-direct to /recipes/:id
   end

   # delete
   # Delete (from Show id page)
  delete '/recipes/:id/delete' do
    recipes.delete(params[:id])
    redirect '/index'
  end
end
