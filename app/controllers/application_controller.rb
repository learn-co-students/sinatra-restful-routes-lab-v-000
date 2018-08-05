class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  # post '/recipes' do
  get '/recipes' do
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:recipe_name], :ingredients => params[:recipe_ingredients], :cook_time => params[:recipe_cook_time])

  redirect to "/recipes/#{@recipe.id}"
  end

  get "/recipes/new" do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do  #load edit form
      @recipe = recipe.find_by_id(params[:id])
      erb :edit
    end

  patch '/recipes/:id' do #edit action
    @recipe = recipe.find_by_id(params[:id])
    @recipe.name = params[:recipe_name]
    @recipe.content = params[:recipe_ingredients]
    @recipe.content = params[:recipe_cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

end
