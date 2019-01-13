class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
    erb :index
  end
   
  get '/recipes/new' do
    erb :new
  end
  
  post '/recipes' do
    @recipe = Recipe.new(params)
    @recipe.save
  redirect :"/recipes/#{@recipe.id}"
  end
  
  
  
  delete '/recipes/:id/delete' do
     @recipe = Recipe.find_by_id(params[:id])
     @recipe.delete
    redirect :'/@recipes'
  end

end
