class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect "/recipes/#{Recipe.last.id}"
  end

  delete "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect '/recipes'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.ingredients = params[:ingredients]
    @recipe.name = params[:name]
    @recipe.cook_time = params[:cook_time]
    erb :show
    #redirect '/recipes'
  end

end
