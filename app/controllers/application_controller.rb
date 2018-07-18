class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #NEW ACTION
  get '/recipes/new' do
    erb :new
  end

  #CREATE ACTION
  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect "recipes/#{@recipe.id}"
  end

  #SHOW ACTION
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #INDEX ACTION
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #EDIT ACTION
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  #UPDATE ACTION
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params["name"], ingredients => params["ingredients"], cook_time => params["cook_time"])

    redirect "/recipes/#{@recipe.id}"
  end

  #DELETE ACTION
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect :index
  end

end
