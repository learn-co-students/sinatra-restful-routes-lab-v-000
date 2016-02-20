class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes' do 
    @recipes = Recipe.all 
    erb :index
  end

  get '/recipes/new' do 
    erb :new
  end

  post '/recipes' do 
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipes = Recipe.find(params[:id]) 
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipes = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipes = Recipes.find(params[:id])
    @recipes.name = params[:name]
    @recipes.ingredients = params[:ingredients]
    @recipes.cook_time = params[:cook_time]
    @recipes.save
    redirect to "/recipes/#{@recipes.id}"
  end

  delete '/recipes/:id/delete' do
    @recipes = Recipe.find(params[:id])
    @recipes.destroy
    redirect '/recipes'
  end

end