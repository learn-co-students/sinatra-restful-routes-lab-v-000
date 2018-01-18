class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipe = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

#   post '/recipes' do
#     @recipe = Recipe.create(name: params[:title], ingredients: params[:ingredients], cook_time: params[:cook_time])
#     redirect to "/recipes/#{@recipe.id}"  
#   end

#   get '/posts/:id/edit' do  #load edit form
#     @post = Post.find_by_id(params[:id])
#     erb :edit
#   end
 
#   patch '/posts/:id' do #edit action
#     @post = Post.find_by_id(params[:id])
#     @post.title = params[:title]
#     @post.content = params[:content]
#     @post.save
#     redirect to "/posts/#{@post.id}"
#   end

#   <form action="/posts/<%= @post.id %>" method="post">
#   <input id="hidden" type="hidden" name="_method" value="patch">
#   <input type="text" name="title">
#   <input type="text" name="content">
#   <input type="submit" value="submit">
# </form>

# delete '/posts/:id/delete' do #delete action
#   #   @post = Post.find_by_id(params[:id])
#   #   @post.delete
#   #   redirect to '/posts'
#   # end

#   <form action="/posts/<%= @post.id %>/delete" method="post">
#   <input id="hidden" type="hidden" name="_method" value="delete">
#   <input type="submit" value="delete">
# </form>

end
