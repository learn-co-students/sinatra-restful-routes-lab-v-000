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
    recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    if recipe.save
      redirect "/recipes/#{recipe.id}"
    else
      redirect "/recipes/new"
    end
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    if @recipe
      erb :show
    else
      404
    end
  end

  get '/recipes/:id/edit' do
    if @recipe = Recipe.find(params[:id])
      erb :edit
    else
      404
    end
  end

  patch '/recipes/:id' do
    recipe = Recipe.update(params[:id], name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect '/recipes'
  end

end
