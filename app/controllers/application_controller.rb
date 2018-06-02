require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipe = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/' do
    @recipe = Recipe.all
    erb :index
  end


get '/recipes/:id' do
  @recipe = Recipe.find_by_id(params[:id])
  erb :show
end


get '/recipes/:id/edit' do
  @recipe = Recipe.find_by_id(params[:id])
  erb :edit
end


  patch '/recipes/:id' do  #updates a recipe
    @recipe = Recipe.find_by_id(params[:id])
    # binding.pry
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

delete '/recipes/:id/delete' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/'
end

end
