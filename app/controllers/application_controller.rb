require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do
    #3 #displays a new recipe form(render)
    erb :new
  end

  post '/recipes' do
    #3#create and save this new recipe to db
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    #binding.pry

    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    #4 display a single recipe
    @recipe = Recipe.find_by_id(params[:id])
    #add a form that allows a user to delete a single recipe
    erb :show
  end

  get '/recipes/:id/edit' do
    #5 renders a form to edit a single recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    #5 edits an existing recipe based on url
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    #reroutes to the show page (recipes/:id)
    redirect "/recipes/#{@recipe.id}"

  end

  get '/recipes' do
    #6 displays all the recipes in the database (an index action)
    #binding.pry
    @recipes = Recipe.all

    erb :index
  end

  delete '/recipes/:id/delete' do
    #7 delete the entry and redirect to the index page
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to "/recipes"
  end



end
