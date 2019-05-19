class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  # need to delete both migrations and start over new table
  # post '/recipes' do
  #   @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients],:cook_time => params[:cook_time])
  #   redirect to "/recipes/#{@recipe.id}"
  # end


  # code actions here!

end
