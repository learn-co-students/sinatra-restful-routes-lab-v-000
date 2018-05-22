class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Create
  get '/recipes/new' do
    erb :recipe_new
  end
  post '/recipes' do
    recipe = Recipe.create(params)
    # todo: check for error?
    redirect "/recipes/#{recipe.id}"
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
  get '/recipes' do     # more restful
    @all = Recipe.all
    erb :index
  end
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :recipe_show
  end



  # update
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    redirect '/index' if !@recipe
    erb :recipe_edit
  end
  patch '/recipes/:id' do
     @recipe = Recipe.find_by_id(params[:id])
     @recipe.name=params[:name]
     @recipe.ingredients=params[:ingredients]
     @recipe.cook_time=params[:cook_time]
     @recipe.save
     erb :recipe_show   # alternatively, re-direct to /recipes/:id
   end

   # delete
   # Delete (from Show id page)
  delete '/recipes/:id/delete' do
    Recipe.delete(params[:id])
    redirect '/index'
  end
end
