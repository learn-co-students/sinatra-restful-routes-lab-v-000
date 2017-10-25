require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @new_recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @new_recipe.save
    redirect "/recipes/#{Recipe.last.id}"
  end

  get '/allrecipes' do
    erb :allrecipes
  end

  get '/recipe/:name' do
    query_name = params[:name]
    @recipe_query = Recipe.find_by(name: query_name)
    if @recipe_query
      erb :recipe
    else
      redirect '/error'
    end
  end

  get '/recipe' do
    erb :recipe
  end

  get '/recipes/:id' do
    @recipe_query = Recipe.find_by_id(params[:id])
    if @recipe_query
      erb :recipe
    else
      redirect '/error'
    end
  end

  post '/recipe/:id' do
    @recipe_query = Recipe.find_by_id(params[:id])
    if @recipe_query
      erb :recipe
    else
      redirect '/error'
    end
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{params[:id]}"
  end

  get '/error' do
    erb :error
  end

  delete '/recipes/:id/delete' do #delete action
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipes'
  end

end
