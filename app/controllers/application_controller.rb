
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    @article = Article.new(params[:article])
    if @article.save
      redirect "/articles/#{@article.id}"
    else
      erb :'articles/new'
    end

    get '/articles/:id/edit'
    @article = Article.find(params[:id])
    erb :edit
  end



end
