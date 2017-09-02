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
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    if @recipe && !@recipe.name.empty?
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      redirect '/recipes/new'
    end
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
    @recipe = Recipe.find_by_id(params[:id])

    if @recipe
      erb :edit
    else
      redirect '/recipes'
    end
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe
      @recipe.name = params[:name] unless params[:name].empty?
      @recipe.ingredients = params[:ingredients] unless params[:ingredients].empty?
      @recipe.cook_time = params[:cook_time] unless params[:cook_time].empty?
      @recipe.save

      redirect "/recipes/#{@recipe.id}"
    else
      redirect '/recipes'
    end
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe
      @recipe.delete
    end
      redirect '/recipes'
  end
end
