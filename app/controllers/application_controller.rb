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

  post '/recipes/new' do 
  	@recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cooktime])
  	@recipe.save
  	redirect "/recipes"
  end

  get '/recipes/:id' do 
  	@recipe = Recipe.find(params[:id])
  	erb :recipe
  end

  get '/recipes/:id/edit' do 
  	@recipe = Recipe.find(params[:id])
  	erb :edit
  end

  patch '/recipes/:id' do 
  	Recipe.find(params[:id]).update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cooktime])
  	redirect "/recipes/#{params[:id]}"
  end

  delete '/recipes/:id' do
  	Recipe.find(params[:id]).remove
  	redirect '/recipes'
  end
end