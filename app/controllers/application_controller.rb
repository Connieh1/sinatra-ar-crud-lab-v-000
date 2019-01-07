
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
      erb :new
    end
  end

  get '/articles/:id/edit' do
    #get params from url
    @article = Article.find(params[:id]) #define intstance variable for view

    erb :edit #show edit article view
  end


  patch '/articles/:id' do
    # binding.pry
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to("/articles/#{params[:id]}")
  end

  delete '/articles/:id' do
    @article_object = Article.delete(params[:id])
    redirect to("/")
  end
#   delete '/articles/<%=@article.id%>' do
#   @article = Article.delete(params[:id])
#   redirect to("/articles")
#   # erb :delete
# end

end
