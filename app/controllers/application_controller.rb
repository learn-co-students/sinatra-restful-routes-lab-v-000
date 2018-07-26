class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
    end

  post '/recipes' do
    recipe = Recipe.new(:name => params[:name],:ingredients => params[:ingredients], :cook_time => params[:cook_time])
    if recipe.save
      erb :recipes
    else
      redirect '/'
    end
  end

    get '/recipes' do
      @recipes =  Recipe.all
      erb :recipes
  end

end
