class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get "/recipes" do

  end

  get '/recipes/:id' do

  end

  post  "/recipes" do

  end

  get '/recipes/:id/edit' do

    erb :edit
  end

  post '/show' do
  end
end