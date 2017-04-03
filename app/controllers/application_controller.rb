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
    recipe = Recipe.new
    recipe.assign_attributes(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.save
    redirect to("/recipes/#{recipe.id}")
  end

  get '/recipes/:id' do
    if !current_recipe
      redirect '/'
    end
      erb :show
  end

  get '/recipes/:id/edit' do
    erb :edit
  end

  patch '/recipes/:id' do
    recipe = current_recipe
    recipe.assign_attributes(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.save
    redirect to("/recipes/#{recipe.id}")
  end

  delete '/recipes/:id/delete' do
    recipe = current_recipe
    recipe.delete
    redirect '/'
  end

  helpers do
      def current_recipe
        Recipe.find_by(id: params[:id])
      end
  end

end
