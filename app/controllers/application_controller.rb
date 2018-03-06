class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.create(params)
    redirect "recipes/#{recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get 'recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch 'recipes/id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredient = params[:ingredient]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    erb :show
  end
end
