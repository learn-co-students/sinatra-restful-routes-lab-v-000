class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  post '/recipes' do
    # binding.pry
    # raise params.inspect
    @recipe = Recipe.create(params)
    redirect to ("recipes/#{@recipe.id}")
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

end
