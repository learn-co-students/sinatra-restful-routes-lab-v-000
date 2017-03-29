class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    # binding.pry
    erb :index
  end

  get '/recipes' do
    # Recipe.create(name: "pie", ingredients: "stuff, things", cook_time: 40)
    erb :recipes
  end

  post '/recipes' do
    recipe = Recipe.new(params)
    recipe.save
    binding.pry
    redirect '/recipes/#{recipe.id}'
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes/:id/delete' do
    erb :delete
  end
end
