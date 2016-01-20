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
  	#binding.pry
  	erb :new_recipe
  end


  post '/recipes/:id/delete' do  
  	recipe=Recipe.find(params[:id]) 
  	recipe.delete
  	redirect '/recipes'
  end

  post '/recipes/:id' do  
  	recipe=Recipe.find(params[:id]) 
  	recipe.name=params[:recipe_name]
  	recipe.ingredients=params[:ingredients_names]
  	recipe.cook_time=params[:cook_time]
  	recipe.save
  	redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do  
  	@recipe=Recipe.find(params[:id]) 
  	erb :edit
  end

  get '/recipes/:id' do  
  	@recipes=[Recipe.find(params[:id])] 
  	#binding.pry
  	erb :recipes
  end

  get '/recipes' do  
  	@recipes=Recipe.all 
  	#binding.pry
  	erb :recipes
  end

  post '/recipes' do
  	@recipe=Recipe.new(name: params[:recipe_name], ingredients: params[:ingredients], cook_time: params[:cook_time])
  	@recipe.save
  	redirect "/recipes/#{@recipe.id}"
  end


end