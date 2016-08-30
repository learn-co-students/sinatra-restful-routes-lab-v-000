class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes/new" do # loads the form to create a new post
    erb :new
  end

  get "/recipes" do # show list of all recipes / loads index page
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/:id" do  #loads show page
      @recipe = Recipe.find_by_id(params[:id])
      erb :show
  end

  get "/recipes/:id/edit" do # load edit
    @recipe = Recipe.find_by_id(params[:id]) # find the user id that was just saved to the database via post '/recipes'
    erb :edit # displays the edit page
  end

  patch "/recipes/:id" do # update action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  post "/recipes" do # action gor creatinng new recipe
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}" # send to this route to display the newly created recipe
  end

  delete "/recipes/:id/delete" do # delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to "/recipes"
  end



end
