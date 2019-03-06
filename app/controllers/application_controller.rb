class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end
  
  get '/recipes' do
    @all_recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  
  patch '/recipies/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/articles/#{@article.id}"
  end
  
  post '/recipes/:id/delete' do
    Recipe.delete_at(params[:id])
  end
  
  
  
end
