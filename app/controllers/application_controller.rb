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
    @recipe = Recipe.new(params)
    #binding.pry
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :recipe
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    erb :recipe
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end

end
