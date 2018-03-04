require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
      erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    Recipe.find(params[:id]).destroy

    redirect '/recipes'
  end

  get '/recipes/:id' do
    erb :show
  end

  get "/recipes/:id/edit" do
    current_recipe(params)
    erb :edit
  end

  patch '/recipes/:id' do
      current_recipe(params).update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
      redirect "/recipes/#{current_recipe(params).id}"
  end

  helpers do

    def current_recipe(params)
      Recipe.find(params[:id])
    end
  end

end
