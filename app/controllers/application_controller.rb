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

  post '/recipes' do
    @recipe = Recipe.create(params[:name], params[:ingredients], params[:cook_time])
    @recipe.save

   redirect "/recipes/#{@recipe.id}"
  end

  post '/show' do

  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
    erb :show

  end

  get '/recipes/:id/edit' do
     @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
     erb :edit
  end

end
