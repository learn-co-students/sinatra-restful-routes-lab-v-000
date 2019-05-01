class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end
  
  post '/recipes' do
    @recipe = Recipe.create(:name => params["name"], :ingredients => params["ingredients"], :cook_time => params["cook_time"])
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    
  end
end
