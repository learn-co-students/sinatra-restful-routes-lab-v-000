require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes= Recipe.all
    erb :index
  end
  

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe= Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    #binding.pry
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  

  patch '/recipes/:id' do
  	@recipe= Recipe.find(params[:id])
  	@recipe.update(:name=>params[:recipe_name], :ingredients=>params[:ingredients_names], :cook_time=>params[:cook_time])
  	#redirect to "/recipes/#{@recipe.id}"
    edit :show
  end

  post '/recipes' do
  	@recipe = Recipe.create(params)
  	redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe= Recipe.find(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
  
end