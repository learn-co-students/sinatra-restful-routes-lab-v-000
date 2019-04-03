class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  # remember order of these /addresses like /recipes/new matter
  # couldn't pass /recipes/new test until i moved it higher in this code file
  
  # new part 1 get
  get '/recipes/new' do 
    erb :new
  end
  # new part 1 get end
  
  # new part 2 post
  # post '/articles' do
  #  @article = Article.create(:title => params[:title], :content => params[:content])
  #  redirect to "/articles/#{@article.id}"
  # end
  
  post '/recipes' do
    # @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time]) # works after fixing spelling errors
    @recipe = Recipe.create(params)
    
    redirect to "/recipes/#{@recipe.id}"
  end
  # new part 2 post end
  
  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :recipe
  end
  
  # edit part 1 get
  # get '/articles/:id/edit' do  #load edit form
  #  @article = Article.find_by_id(params[:id])
  #  erb :edit
  # end
  
  get '/recipes/:id/edit' do
    @recipe= Recipe.find(params[:id])
    erb :edit
  end
  # edit part 1 get end
  
  # edit part 2 patch
  # patch '/articles/:id' do #edit action
  #   @article = Article.find_by_id(params[:id])
  #   @article.title = params[:title]
  #   @article.content = params[:content]
  #   @article.save
  #   redirect to "/articles/#{@article.id}"
  # end
  
  patch '/recipes/:id' do #edit action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    
    redirect to "/recipes/#{@recipe.id}"
  end
  # edit part 2 patch end
  
  # delete
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    
    redirect to '/recipes'
  end
  # delete end
  
end
