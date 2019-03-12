require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes=Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    recipe = Recipe.find(params[:id].to_i)
    # binding.pry
    erb '/show'
  end

  post '/recipes' do
    recipe = Recipe.new({name: params[:name],
                        ingredients: params[:ingredients],
                        cook_time: params[:cook_time]})
    recipe.save
    redirect to '/recipes/'+recipe.id.to_s
  end

end
