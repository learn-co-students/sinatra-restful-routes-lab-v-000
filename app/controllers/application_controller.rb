class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


 get '/' do 
   redirect '/recipes'
 end 
 
 
 get '/recipes' do 
   @recipes = Recipe.all 
   erb :index 
 end 
 
 
 get '/recipes/new' do 
   erb :new 
  end 
 
 
 

end
