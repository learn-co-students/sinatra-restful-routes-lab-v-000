require 'pry'
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

  	erb :new
  end

  post '/recipes' do
  	@recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

  	
  	redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do

  	@recipe = Recipe.find_by(id: params[:id]) 
  	
  	erb :show
  end

  get '/recipes/:id/edit' do 
  	@recipe = Recipe.find_by(id: params[:id])

  	erb :edit

  end

  patch '/recipes/:id' do
  	# binding.pry

  	@recipe = Recipe.find_by(id: params[:id])

  	if params[:name] != ""
  		@recipe.name = params[:name]
  	end

  	if params[:ingredients] != ""
  		@recipe.ingredients = params[:ingredients]
  	end

  	if params[:cook_time] != ""
  		@recipe.cook_time = params[:cook_time]
  	end
  	@recipe.save

  	redirect "/recipes/#{@recipe.id}"

  end

  delete '/recipes/:id/delete' do
  	@recipe = Recipe.find_by(id: params[:id])
  	@recipe.delete

  	redirect '/recipes'
  end



end