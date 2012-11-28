class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article  = Article.find(params[:id])
    @comments = @article.comments.dup
    @comment  = @article.comments.build
    @star     = @article.starers.include? current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # PUT /articles/1/add_star
  def add_star
    @article  = Article.find(params[:id])
    @article.starers << current_user
    flash[:notice] = 'The article is now starred.'

    redirect_to :action => 'show'
  end

  # PUT /articles/1/remove_star
  def remove_star
    @article  = Article.find(params[:id])
    @article.starers.delete current_user
    flash[:notice] = 'The article is not starred anymore.'

    redirect_to :action => 'show'
  end

end

