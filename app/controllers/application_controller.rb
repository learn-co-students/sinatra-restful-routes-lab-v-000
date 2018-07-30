require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do   #index action - list all recipes
    @recipes=Recipe.all
    erb :"/recipes/index"
  end

  get '/recipes/new' do  # new action - shows new recipe form
    erb :"recipes/new"
  end

   post '/recipes' do   # create action - create recipes
     @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
     redirect to "/recipes/#{@recipe.id}"
   end

   get '/recipes/:id' do    # show action
     @recipe = Recipe.find_by_id(params[:id])
     erb :"recipes/show"
   end

   get '/recipes/:id/edit' do  #edit action
    @recipe = Recipe.find_by_id(params[:id])
     erb :"recipes/edit"
   end

   patch '/recipes/:id' do  # edit action
     @recipe=Recipe.find_by_id(params[:id])
       @recipe=recipe.update(
         @recipe.name=params[:name],
         @recipe.ingredients=params[:ingredients],
         @recipe.cook_time=params[:cook_time])
         @recipe.save
         redirect to "recipes/#{@recipe.id}"

     end

   delete '/recipes/:id/delete' do # delete action
     Recipe.find(params[:id]).destroy
     redirect to "/recipes"
   end


end
