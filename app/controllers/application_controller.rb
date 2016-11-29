class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do 
    
    erb :recipes
  end

  post '/recipes' do 
    @recipe = Recipe.create(:recipe => params[:name], :ingredients => params[:ingredients])

    redirect to '/recipes/#{@recipe.id}'
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

  post '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.save

    redirect to '/recipes/#{@recipe.id}'
  end




end