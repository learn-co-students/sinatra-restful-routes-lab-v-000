class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save

    redirect '/recipes/' + @recipe.id.to_s
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :recipe
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    erb :recipe
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipes
  end

  delete '/recipes/:id/delete' do
    Recipe.find_by_id(params[:id]).destroy
  end
  
end
