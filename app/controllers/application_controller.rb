class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
   # binding.pry
    erb :index
  end
  get '/recipes/:id' do

  end

  get '/recipes/:id/edit' do

    erb :edit
  end

  post '/show' do
     # @recipe = Recipe.new(:nam => recipe_name, :ingredients => recipe_ingredients, :cook_time => recipe_cook_time)
  end
end