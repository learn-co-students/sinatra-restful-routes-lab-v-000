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
  
  get '/recipes/:id' do
  @arecipe = Recipe.find_by_id(params[:id])
  erb :show
end
  
  post '/recipes' do
  @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  @recipe.save
  redirect to "/recipe/#{@recipe.id}"
  end

end
