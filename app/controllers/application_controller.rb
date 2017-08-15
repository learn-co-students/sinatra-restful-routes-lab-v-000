class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes/new' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time].to_f)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    erb :show
  end

  get '/recipes' do
    erb :index
  end

  delete '/recipes/:id/delete' do
    Recipe.destroy(params[:id])
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do
    erb :edit
  end

  patch '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{params[:id]}"
  end

end