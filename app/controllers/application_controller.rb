class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes=Recipe.all
    erb :recipes
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe=Recipe.find(params[:id])
    erb :show
  end

  post '/recipes' do
    @recipe=Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    binding.pry
    @recipe=Recipe.find(params[:id])
    erb :edit_recipe
  end

end
