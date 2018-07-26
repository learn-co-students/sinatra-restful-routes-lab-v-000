class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes =  Recipe.all
    erb :recipes

    get '/articles/new' do
    erb :new
    end

    post '/recipes' do
    @recipes = Recipes.create(:name => params[:name],:ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/articles/#{@article.id}"
  end


  end



end
