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

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    if !!@recipe.id
      erb :show
    else
      redirect '/failure'
    end
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    if !!@recipe.id
      erb :edit
    else
      redirect '/failure'
    end
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    if !!@recipe.id
      @recipe.name = params[:name]
      @recipe.ingredients = params[:ingredients]
      @recipe.cook_time = params[:cook_time]
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      redirect '/failure'
    end
  end

  post '/recipes' do
    @recipe = Recipe.new( :name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    if !!@recipe.name && @recipe.save then
      redirect "/recipes/#{@recipe.id}"
    else
      redirect '/failire'
    end
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    if !!@recipe.id
      @recipe.delete
      redirect to '/recipes'
    else
      redirect to '/failure'
    end
  end



end
