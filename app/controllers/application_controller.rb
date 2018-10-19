class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect '/recipes'
  end

  get '/recipes/new' do
    erb :'recipes/new'
  end

  # get '/recipes' do
  #   erb :
  # end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(params[:id])
    erb :'recipes/show/#{@recipe.id}'
  end
end
