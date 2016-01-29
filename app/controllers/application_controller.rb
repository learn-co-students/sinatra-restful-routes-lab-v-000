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
    @recipe = Recipe.new(name: params["name"], ingredients: params["ingredients"], cook_time: params["cook_time"])
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes/:id/delete' do 
    Recipe.find(params[:id]).destroy
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])

    erb :edit
  end

  post '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    @recipe.update(name: params["name"], ingredients: params["ingredients"], cook_time: params["cook_time"])
    redirect "/recipes/#{@recipe.id}"
  end



end