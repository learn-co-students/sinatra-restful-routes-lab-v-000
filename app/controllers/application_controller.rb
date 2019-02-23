class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    redirect to "/recipes"
  end
  
  get '/recipes' do 
    @recipes = Recipe.all 
    erb :index 
  end
  
  get '/recipes/new' do 
    erb :new 
  end
  
  post '/recipes' do 
    @recipe = Recipe.new({name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time]})
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit 
  end
  
  patch '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  
  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect to '/recipes'
  end

end
