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

  post '/recipes' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    if @recipe.save
      redirect to "/recipes/#{@recipe.id}"
    else
      redirect to "/failure"
    end
    erb :index
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    recipe.delete
    redirect to "/recipes"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

end
