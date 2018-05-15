require 'pry'
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
    erb :recipes
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes'do
    # binding.pry
    Recipe.create(params)
    redirect "/recipes/#{Recipe.last.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    params.each do |k, v|
        @recipe[k] = v if @recipe[k]
    end
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

end
