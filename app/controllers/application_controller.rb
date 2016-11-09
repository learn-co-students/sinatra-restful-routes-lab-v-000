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
    erb :'new/recipes'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :'show/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :'edit/recipes'
  end

  post '/recipes' do
    recipe = Recipe.create(name:params[:name] ,ingredients:params[:ingredients] ,cook_time:params[:cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  patch '/recipes/:id/edit' do
    recipe = Recipe.find_by(id:params[:id])
    recipe.update(name:params[:name], ingredients:params[:ingredients], cook_time:params[:cook_time])
    redirect "/recipes/#{params[:id]}"
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find_by(id:params[:id])
    recipe.delete
    redirect '/recipes'
  end

end
