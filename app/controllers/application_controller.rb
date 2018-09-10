class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    
    erb :index
  end

  get '/recipes/new' do

    erb :new
  end

  post '/recipes' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients])
    
    redirect to "/recipes/#{recipe.id}"

  end


  get '/recipes/:id' do
    @recipe = Recipe.find_by(:id => params[:id])
    
    erb :show
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find_by(:id=>params[:id])
    recipe.delete

    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(:id => params[:id])

    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(:id=>params[:id])
    
    @recipe.name = params[:name]
    @recipe.cook_time = params[:cook_time]
    @recipe.ingredients = params[:ingredients]
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end

  

end