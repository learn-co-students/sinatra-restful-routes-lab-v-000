class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

    get '/recipes' do
      @recipes = Recipe.all
      erb :index
    end
    
    get '/recipes/new' do 
      erb :new
    end
    
    get '/recipes/:id' do 
      @recipe = Recipe.find(params[:id])
      erb :show
    end 
  
    delete '/recipes/:id/delete' do
      @recipe = Recipe.find(params[:id])
      @recipe.delete
      redirect '/recipes'
    end
  
    get '/recipes/:id/edit' do
      @recipe = Recipe.find(params[:id])
      erb :edit
    end
  
    patch '/recipes/:id' do
      @recipe = Recipe.find(params[:id])
      @recipe.name = params[:name]
      @recipe.ingredients = params[:ingredients]
      @recipe.cook_time = params[:cook_time]
      @recipe.save
      redirect to "/recipes/#{@recipe.id}"
    end
  
    post '/recipes' do
      @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
      @recipe.save
      redirect to "/recipes/#{@recipe.id}"
    end
end
