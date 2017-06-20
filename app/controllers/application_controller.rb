class ApplicationController < Sinatra::Base
configure do
  set :public_folder, 'public'
  set :views, 'app/views'
end


    get '/' do
    erb :index
    end

    get '/recipes' do
      erb :index
    end
    

    get '/recipes/new' do
    erb :new
    end
    
    
    post '/recipes' do
         Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
         redirect "/recipes/#{Recipe.last.id}"
    end
    
    get '/recipes/:id' do
        @id = params[:id]
        erb :show
    end
    
    get '/recipes/:id/edit' do
          @id = params[:id]
          erb :edit
    end

    patch '/recipes/:id' do
      @id = params[:id]
      Recipe.find(@id).update(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
      redirect "/recipes/#{@id}"
    end
    

    patch '/recipes/:id' do
      @id = params[:id]
      Recipe.find(@id).update(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
      redirect "/recipes/#{@id}"
    end


    delete '/recipes/:id' do
          
            Recipe.delete(params[:id])
            erb :index
    end



end#eoc