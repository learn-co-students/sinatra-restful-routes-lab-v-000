class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/recipes' do
    # binding.pry
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  get '/recipes/new' do
    # binding.pry


    erb :new
  end

  post 'recipes/post' do
    @recipe = Recipe.new(params)
    @recipe.save
    redirect '/recipes'
  end


  get "/recipes/:id" do
    # binding.pry
    @recipe = Recipe.find(params[:id])
    erb :"recipe/#{@recipe.id}"
  end

end
