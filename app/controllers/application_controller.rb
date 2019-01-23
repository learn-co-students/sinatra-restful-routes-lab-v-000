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
  	erb :create
  end

  get '/recipes/:id' do
  	@recipe = Recipe.find(params[:id])

  	erb :show
  end

  get '/recipes/:id/edit' do
  	@recipe = Recipe.find(params[:id])
  	erb :edit
  end

  patch '/recipes/:id' do

  	erb :show
  end

  delete '/recipes/:id' do
  	Recipe.delete(params[:id])

  	redirect '/recipes'
  end

  post '/recipes' do
  	recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  	recipe.save

  	redirect "/recipes/#{recipe.id}"
  end

end
