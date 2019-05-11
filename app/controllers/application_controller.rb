class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  #index show articles
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  #show form to create new article
  get '/recipes/new' do
    erb  :new
  end





  #new post created
  post '/recipes' do
    
    @new_recipe= Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect to '/recipes/'+ @new_recipe.id.to_s
#      redirect "/recipes/#{@new_recipe.id}"
  end



  #show post
  get '/recipes/:id' do
    @recipe= Recipe.find_by(:id =>  params[:id])
    erb :show
  end


  #edit post
  get '/recipes/:id/edit' do
    @recipe= Recipe.find_by(:id =>  params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
      #  binding.pry
       @mod= Recipe.find(params[:id])
       @mod.update(params[:recipe])

     redirect "/recipes/#{@mod.id}"  #esta forma se llama interpolation
  end


    # end

  # delete '/recipes/:id/delete' do
  #
  #   @recipe = Recipe.destroy(params[:id])
  #   redirect '/recipes'
  # end

  delete '/recipes/:id' do

           @del= Recipe.find(params[:id])

           @del.destroy
           erb :delete
     end

end
