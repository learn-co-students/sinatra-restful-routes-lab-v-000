require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/recipes'
  end

  get '/recipes' do

    @recipes = Recipe.all
    erb :index

  end

  get '/recipes/:id' do
    @recipe9 = Recipe.find_by_id(params[:id])

    erb :show
  end

  delete '/recipes/:id/delete' do #delete action
    @recipe3 = Recipe.find_by(params[:id])
    @recipe3.delete
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

patch '/recipes/:id' do #edit action
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save
  redirect to "/recipes/#{@recipe.id}"
end

get '/recipes/new' do
  erb :new
end

post '/recipes' do
  binding.pry
  @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], cook_time: params[:cook_time])
  redirect to "/recipes/#{@recipe.id}"
end


  # get '/create' do
  #   erb :create
  # end
  #
  # post '/recipes' do
  #   puts params
  #   recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
  #   recipe.save
  #   redirect to '/recipes'
  # end


end

# In the application_controller.rb, set up a controller action
# that will render a form to create a new recipe.
# This controller action should create and save this new recipe to the database.
