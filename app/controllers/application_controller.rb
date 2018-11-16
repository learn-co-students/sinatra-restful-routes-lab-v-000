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
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect "/recipes/#{Recipe.last.id}"
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :recipe
  end
  
  delete '/recipes/:id' do
    Recipe.find(params[:id]).destroy
    redirect "/recipes"
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit  
  end
  
  patch '/recipes/:id' do
    @recipe = Recipe.update(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect "/recipes/#{:id}"
  end

end
