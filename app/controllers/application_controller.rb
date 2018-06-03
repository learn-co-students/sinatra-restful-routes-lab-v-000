class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  # NEW action
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.new
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save

    redirect "/recipes/#{recipe.id}"
  end

  # SHOW action
  get '/recipes/:id' do
    # Recipe.find throws an exception on failure,
    # whereas find_by just returns nil
    recipe = Recipe.find_by(id: params[:id])

    if recipe
      "#{recipe.name + "<br>" + recipe.ingredients + "<br>" + recipe.cook_time}"
    else
      "RECIPE NOT FOUND"
    end
  end
end