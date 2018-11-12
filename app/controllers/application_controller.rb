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
  
  post '/recipes/new' do
    recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes"
  end
  
  post '/recipes/:id/delete' do
    erb :delete
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :recipe
  end

end
