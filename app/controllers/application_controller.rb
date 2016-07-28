class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
    "{@recipe1.id}"
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
    erb :show

  end

  get '/recipes/:id/edit' do
     @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
     # redirect "/recipes/#{@cookie.id}/edit"
     erb :edit
  end

  post '/show' do

  end

  post '/recipes' do  #creates a recipe
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end
end
