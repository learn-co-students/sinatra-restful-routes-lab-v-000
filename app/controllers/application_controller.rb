class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do 
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save
    redirect "/recipes/" + "#{@recipe.id}"
  end

#NEW
  get '/recipes/new' do 
    erb :new
  end

  post '/recipes/new' do 
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save
    redirect "/recipes/" + "#{@recipe.id}" 
  end

#SHOW
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end

#EDIT
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit 
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.name = params([:name])
    @recipe.ingredients = params([:ingredients])
    @recipe.cook_time = params([:cook_time])
  end

  #DELETE
  delete '/recipes/:id/delete' do 
    @recipe = Recipe.find(params[:id])
    @recipe.delete 
    redirect '/recipes'
  end
end