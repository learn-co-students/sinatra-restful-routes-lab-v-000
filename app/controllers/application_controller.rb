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

  get '/recipes/:id' do
    @r =  Recipe.find(params[:id])
    erb :recipe
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients])
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @r = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @r = Recipe.find(params[:id])
    @r.name = params[:name]
    @r.ingredients = params[:ingredients]
    @r.cook_time = params[:cook_time]
    @r.save

    redirect to "/recipes/#{@r.id}"
  end

  delete '/recipes/:id/delete' do
    @r = Recipe.find(params[:id])
    @r.delete
    redirect to '/recipes'
  end
end
