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
    erb :new
  end
  
  post '/recipes' do
    recipe = Recipe.new(:name => params["name"], :ingredients => params["ingredients"], :cook_time => params["cook_time"])
    if recipe.save
      redirect "/recipes/#{recipe.id}"
    else
      redirect "/recipes"
    end
  end
  
  get '/recipes/:id' do
    if @recipe = Recipe.find_by(:id => params[:id])
      erb :show
    else
      redirect "/recipes"
    end
  end
  
  get '/recipes/:id/edit' do
    if @recipe = Recipe.find_by(:id => params[:id])
      erb :edit
    else
      redirect "/recipes"
    end
  end
  
  patch '/recipes/:id' do
    if recipe = Recipe.find_by(:id => params[:id])
      recipe.name        = params["name"]
      recipe.ingredients = params["ingredients"]
      recipe.cook_time   = params["cook_time"]
      if recipe.save
        redirect "/recipes/#{recipe.id}"
      else
        redirect "/recipes"
      end
    else
      redirect "/recipes"
    end
  end
  
  delete '/recipes/:id/delete' do
    if recipe = Recipe.find_by(:id => params[:id])
      recipe.delete
      redirect "/recipes"
    else
      redirect "/recipes"
    end
  end
  
end
