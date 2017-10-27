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

  post '/recipes/new' do

    @recipe = Recipe.new(params)
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes' do

    @recipes = Recipe.all
    #name: params[:name], ingredients: params[:ingredients], cook_time: params[:ingredients]
    erb :recipes
  end

  get '/recipes/:id' do
    @post = Post.find_by(id: params[:id])

    erb :show
  end

  delete 'recipes/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.delete

    redirect '/recipes'
  end
end
