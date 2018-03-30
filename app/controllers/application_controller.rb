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
    erb :recipes
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  post '/recipes' do
    @recipe = Recipe.create(:name=>params[:name], :ingredients=>params[:ingredients], :cook_time=>params[:cook_time])
    redirect to "/recipes/#{Recipe.last.id}"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to '/recipes'
  end


end
