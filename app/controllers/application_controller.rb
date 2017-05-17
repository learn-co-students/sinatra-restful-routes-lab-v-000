class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :database, "#{ENV['SINATRA_ENV']}.sqlite"
    set :method_override, true
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    Recipe.create(name: params[:name],ingredients:params[:ingredients],cook_time:params[:cook_time])
    redirect "/recipes/#{Recipe.last.id}"
  end

  get "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    Recipe.find_by_id(params[:id]).update_attributes(name: params[:name], ingredients: params[:ingredients], cook_time:params[:cook_time])
    redirect "/recipes/#{params[:id]}"
  end

  delete "/recipes/:id/delete" do
    Recipe.destroy(params[:id])
    redirect '/recipes'
  end

end
