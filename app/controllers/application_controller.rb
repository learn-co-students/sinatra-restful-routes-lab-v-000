class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients])
    @recipe.save
    redirect "recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
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
  redirect to "/recipes/#{@recipe.id}"
end

get '/recipes' do
  @recipe = Recipe.all
  erb :index
end

delete '/recipes/:id/delete' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipes'
    end
  end
