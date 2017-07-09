require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/recipes"
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

  delete '/recipes/:id/delete' do  
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy

    erb :delete
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :edit
  end

  patch '/recipes/:id' do  #redirect back to Show page
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingrdients = params[:ingrdients]
    @recipe.cook_time = params[:cook_time]
    
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end
  

end