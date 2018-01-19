require 'pry'
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

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"  
  end


  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end

# <% @recipe.each do |r|%>
#   <a href="/recipes/<%= r.id %>">Name: <%= r.name %></a>
#   <a href="/recipes/<%= r.id %>">Ingredients: <%= r.ingredients %></a>
#   <a href="/recipes/<%= r.id %>">Cooking Time: <%= r.cook_time %></a>
#   <% end %>
    #get '/recipes/:id/:test/:whatever' do whatever is like an arguymebnt
    #/recipes/183/cheese/italian
    #params[:id] => 183
    #params[:test] => cheese
    #params[:whatever] => italian

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



