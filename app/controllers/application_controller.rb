class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    @recipe = Recipe.new
    erb :form
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :form
  end

  post '/recipes' do
    recipe = Recipe.new(params[:recipe])
    if recipe.save
      redirect "/recipes/#{recipe.id}"
    else
      "Error saving"
    end
  end
end