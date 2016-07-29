class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
    erb :show

  end

  get '/recipes/:id/edit' do
     @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
     erb :edit
  end

  patch '/recipes/:id/edit' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
    redirect to "/recipes/#{@cook.id}"
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end


  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
    @recipe.delete
    redirect to "/recipes"
  end


end
