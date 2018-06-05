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


  # get "/recipes/#{recipe.id}" do
  #
  #   erb :"recipe/show"
  # end

end
