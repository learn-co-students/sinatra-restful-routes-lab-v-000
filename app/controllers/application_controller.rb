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

  get '/recipes/new' do # input form new recipe
    erb :new
  end

  post '/recipes' do  #create new recipe reroutes to recipe page
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end


  get '/recipes/:id' do 
  @recipe = Recipe.find_by_id(params[:id])
  erb :show
 end


delete '/recipes/:id/delete' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipes'
end

get '/recipes/:id/edit' do  #form to edit recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
end


# must add use Rack::MethodOverride & hidden input to form  to config to have patch work
patch '/recipes/:id' do  #updates recipe acorrding to input
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save
  redirect to "/recipes/#{@recipe.idß}"
end



end