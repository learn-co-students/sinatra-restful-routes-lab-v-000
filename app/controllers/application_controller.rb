
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    
    redirect '/recipes'
  end

  get '/recipes' do
    @all = Recipe.all
    
    erb :index
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    
    erb :show
  end
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(id: params[:id])
    
    erb :edit
  end
  
  patch '/recipes/:id' do 
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    
    redirect '/recipes/#{@recipe.id}'
  end

=begin
  put '/recipes/:id' do
    # find and replace recipe, may not need this one
    
    redirect '/recipes/#{@recipe.id}'
  end
=end 

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.delete
    
    redirect '/recipes'
  end
  
end