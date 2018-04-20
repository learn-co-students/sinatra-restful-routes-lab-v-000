require 'pry'
  use Rack::MethodOverride
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  use Rack::MethodOverride

  get '/recipes/new' do
    erb :new
  end


  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    # binding.pry
    # @recipe.id = params[:id]
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.id = params[:id]
    erb :show
  end

  post '/recipes' do
    @recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save
    #  params[:id] = @recipe.id
    @recipes = Recipe.all
    # binding.pry
    redirect to "/recipes/#{@recipe.id}"

  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end


  patch '/recipes/:id' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save
   redirect to "/recipes/#{@recipe.id}"
  # erb :show
  end

  post '/recipes' do
    @recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save
    @recipes = Recipe.all
    redirect to "/recipes/#{@recipe.id}"

  end

  delete '/recipes/:id/delete' do #delete action
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipes'
end
end
