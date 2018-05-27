class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  #INDEX ACTION
  # get '/' do
  #   erb :index
  # end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #NEW ACTION
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name])
    redirect to "/posts/#{@recipe.id}"
  end

  #SHOW ACTION
  get '/recipes/:id' do
    @recipe = Post.find_by_id(params[:id])
    erb :show
  end

  #EDIT ACTION
  get 'recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch 'recipes/:id' do
    @recipe = Recipe.find_by_id(parmams[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
    #**DON'T FORGET TO ADD LINE TO FORM **
  end

  #DELETE ACTION
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
  
end
