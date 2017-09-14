class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
      #shows all recipes
      @recipes = Recipe.all
      erb :index
  end

  get '/recipes/new' do
      #shows all recipes
      erb :new
  end

  post '/recipes' do
    recipe = Recipe.create(:name => params[:name] , :ingredients => params[:ingredients] , :cook_time => params[:cook_time] )
    recipe.save
    id = recipe.id
    redirect "/recipes/#{id}"
  end

  get '/recipes/:id' do
    #shows specific recipe
    @recipe = Recipe.find(params[:id])
    erb :single
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id/edit' do
    recipe = Recipe.find(params[:id])
    recipe.update(:name => params[:name] , :ingredients => params[:ingredients] , :cook_time => params[:cook_time])
    id = recipe.id
    redirect "/recipes/#{id}"
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect '/recipes'
  end
end
