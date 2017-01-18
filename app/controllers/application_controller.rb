class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  # Instead of relying solely on the URL to indicate what site to visit, a RESTful route also depends on the HTTP verb and the URL.

   get '/recipes' do #index
    @recipes = Recipe.all
    erb :index
   end 
 
 
   get '/recipes/new' do #new
    erb :new
  end 
  
  post '/recipes' do #create
    @recipe = Recipe.create(name: params[:name], ingredients: params[:content], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"  #redirects to the show page, how exactly??
    #redirect '/show'
  end
  
   get '/recipes/:id' do #show
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do #edit 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end 
  
  patch '/recipes/:id' do #edit form submission 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"  #redirects to show page 
  end 
  
  delete '/recipes/:id/delete' do #delete
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end 
end 