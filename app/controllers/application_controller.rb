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

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    if @recipe
      redirect '/recipes/#{@recipe.id}'
    else
      redirect '/recipes'
    end
  end

  get '/recipes/new' do
    redirect '/recipes'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe
      erb :show
    else
      redirect '/recipes'
    end
  end

  get '/recipes/:id/edit' do
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(params[:name])
    @recipe.update(params[:ingredients])
    @recipe.update(params[:cook_time])
    redirect '/recipes/#{@recipe.id}'
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect '/recipes'
  end
end
