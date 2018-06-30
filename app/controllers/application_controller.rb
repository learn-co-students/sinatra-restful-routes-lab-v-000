class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients= params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    redirect to "recipe/#{@recipe.id}"
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params[:name], params[:ingredients], params[:cook_time])
    redirect to "recipe/#{@recipe.id}"
  end


  # helpers do
  #   def all
  #
  #     @recipes.each do |recipe|
  #       "#{recipe.name} for more infomration /recipes/#{recipe.id}"
  #     end
  #   end
  # end
end
