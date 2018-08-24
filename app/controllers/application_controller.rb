require 'pry'

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

get '/recipes' do
  @recipe = Recipe.all
  erb :index

end

get '/recipes/:id' do
  @recipe = Recipe.find_by(id: params[:id])
  erb :show
end


post '/recipes' do

  recipe = Recipe.new
  recipe.name = params[:name]
  recipe.ingredients = params[:ingredients]
  recipe.cook_time = params[:cook_time]
  recipe.save
  redirect "/recipes/#{recipe.id}"
end


delete '/recipes/:id/delete' do


  @recipe = Recipe.find_by(id: params[:id])
  @recipe.delete
  redirect '/recipes'
end

get '/recipes/:id/edit' do
  @recipe = Recipe.find_by(id: params[:id])
  erb :edit
end

patch '/recipes/:id/edit' do
  recipe = Recipe.find_by(id: params[:id])
  recipe.name = params[:name]
  recipe.ingredients = params[:ingredients]
  recipe.cook_time = params[:cook_time]
  recipe.save
  redirect "/recipes/#{recipe.id}"
end


end
