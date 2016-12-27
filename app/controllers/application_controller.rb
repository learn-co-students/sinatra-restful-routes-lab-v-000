require "./config/environment"
require "./app/models/recipe"
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end
  get '/recipes' do
    @list_all=Recipe.all
    erb :recipes
  end
  get '/recipes/new' do
    erb :new
  end
  post '/recipes' do
    @cur=Recipe.create(params)
    redirect '/recipes/'+@cur.id.to_s
  end
  get '/recipes/:id' do
    @cur=Recipe.find(params[:id].to_i)
    erb :recipe
  end
  get '/recipes/:id/edit' do
    @cur=Recipe.find(params[:id].to_i)
    erb :edit
  end
  post  '/recipes/:id' do
    Recipe.update(params[:id].to_i,name:params[:name],ingredients:params[:ingredients], cook_time:params[:cook_time])
    redirect 'recipes/'+params[:id]
  end
  post  '/recipes/:id/delete' do
    Recipe.delete(params[:id])
  end
end
