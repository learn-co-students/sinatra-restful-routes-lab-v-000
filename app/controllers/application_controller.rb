class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
   	@recipes = Recipe.all
     erb :index
   end

    get '/recipes/new' do
   	erb :new
   end

   get '/recipes' do
   	@recipes = Recipe.all
   	erb :index
   end

   get '/recipes/:id' do
   	@recipe = Recipe.find(params[:id].to_i)
   	erb :show
   end

   post '/recipes' do
   	@recipe = Recipe.create(params)
   	redirect "/recipes/#{@recipe.id}"

   end

   get '/recipes/:id/edit' do
   	@recipe = Recipe.find(params[:id].to_i)
   	erb :edit
   end

    patch '/recipes/:id' do
    	@recipe = Recipe.find(params[:id].to_i)
    	@recipe.update(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])
   	erb :show
   end

   delete '/recipes/:id/delete' do
   	@recipe = Recipe.find(params[:id].to_i)
   	@recipe.delete
   	redirect '/recipes'
   end
 end
