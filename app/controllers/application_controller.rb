class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/recipes' do
    erb :recipes
  end

  get '/recipes/new' do
    erb :new_recipe
  end

  post '/recipes' do
    @new_recipe = Recipe.create(params)
    @new_recipe.save
    redirect "/recipes/#{@new_recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :individual_recipe
  end

  get '/recipes/:id/edit' do
    @id = params[:id]
    erb :edit_recipe
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect "/recipes"
  end
end
