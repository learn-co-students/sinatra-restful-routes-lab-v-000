require 'pry'
class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    end
    get '/' do
        erb :index
    end

    get '/recipes' do
        @recipes = Recipe.all
        erb :recipes
    end
    get '/recipes/new' do
        erb :new
    end

    post '/recipes' do
        recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
        recipe.save

        redirect "/recipes/#{recipe.id}"
    end

    get '/recipes/:id' do
        @recipe = Recipe.find(params[:id])

        if @recipe
            erb :show
        else
            redirect '/recipes'
        end
    end

    get '/recipes/:id/edit' do
        @recipe = Recipe.find(params[:id])

        erb :edit
    end

    delete '/recipes/:id/delete' do
        recipe = Recipe.find(params[:id])
        recipe.delete
        redirect "/recipes/#{params[:id]}"
    end

    patch '/recipes/:id/edit' do
        recipe = Recipe.find(params[:id])
        recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
        redirect "/recipes/#{params[:id]}"
    end
end