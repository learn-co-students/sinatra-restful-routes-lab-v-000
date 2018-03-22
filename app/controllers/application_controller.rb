class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get 'recipes/new' do
    erb :new
  end

  get 'recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get 'recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  



end
