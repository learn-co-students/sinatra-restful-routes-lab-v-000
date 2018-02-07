class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/recipes"
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
      # binding.pry
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

    get '/recipes/:id' do
      @recipe = Recipe.find_by_id(params[:id])
        #  binding.pry
      erb :show
    end

    get '/recipes/:id/edit' do
      @recipe = Recipe.find_by_id(params[:id])
      erb :edit
    end

    patch '/recipes/:id' do
      # binding.pry
      @recipe = Recipe.find_by_id(params[:id])
      @recipe.name = params[:recipe_name]
      @recipe.ingredients = params[:recipe_ingredients]
      @recipe.cook_time = params[:recipe_cook_time]
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    end

    delete '/recipes/:id/delete' do
        @recipe = Recipe.find_by_id(params[:id])
        @recipe.delete
    end




end
