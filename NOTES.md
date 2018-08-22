get '/articles/new' do
  erb :new
end
 
post '/articles' do
  @article = Article.create(:title => params[:title], :content => params[:content])
  redirect to "/articles/#{@article.id}"
end