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

  post '/recipes' do
    recipe = Recipe.new(:name => params["name"], :ingredients => params["ingredients"], :cook_time => params["cook_time"])
    recipe.save

    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id' do
    if @recipe = Recipe.find(params[:id])
      erb :show
    else
      erb :not_found
    end
  end

  delete '/recipes/:id/delete' do
    if recipe = Recipe.find(params[:id])
      recipe.destroy
      redirect '/recipes'
    else
      erb :not_found
    end
  end

  get '/recipes/:id/edit' do
    if @recipe = Recipe.find(params[:id])
      erb :edit
    else
      erb :not_found
    end
  end

  patch '/recipes/:id' do
    if @recipe = Recipe.find(params[:id])
      @recipe.name = params["name"] unless params["name"].nil?
      @recipe.ingredients = params["ingredients"] unless params["ingredients"].nil?
      @recipe.cook_time = params["cook_time"] unless params["cook_time"].nil?
      @recipe.save
      erb :show
    else
      erb :not_found
    end
  end


end
