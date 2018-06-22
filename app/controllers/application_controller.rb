class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  get '/recipes/new' do
    #binding.pry

    erb :new
  end

  get '/recipes/:id' do
    #binding.pry
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :edit
  end

  patch '/recipes/:id' do
    binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end


  post '/recipes' do
    #binding.pry
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    #binding.pry

    #session[:id] = @recipe.id
    #binding.pry
    redirect to "/recipes/#{@recipe.id}"
    #redirect to "/posts/#{@post.id}"
  end



end
