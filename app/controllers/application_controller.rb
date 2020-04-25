class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  "Vegan Breakface Recipes"
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
    end

    post '/recipes' do
      @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
    end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe2 = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
  @recipes2 = Article.find(params[:id])
  @recipes2.name = params[:name]
  @recipes2.ingredients = params[:ingredients]
  @recipes2.cook_time = params[:cook_time]
  @recipes2.save
  redirect to "/recipes/#{@recipes2.id}"
end

delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end
