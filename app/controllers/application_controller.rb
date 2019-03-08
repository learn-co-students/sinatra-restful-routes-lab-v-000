class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes' do 
    @recipes = Recipe.all
    erb :recipes
  end 
  
  get '/recipes/new' do
  erb :new
  end
  
  post '/recipes' do
  @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  @recipe.save
  redirect "/recipe/#{@recipe.id}"
  end
  
  get '/recipes/:id' do
  @recipe = Recipe.find_by_id(params[:id])
  erb :show
  end
  
  

end
