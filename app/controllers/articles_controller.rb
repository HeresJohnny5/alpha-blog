class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update,]
  # This helper will perform the symbol before any action method listed

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
    #articles is found in the routes prefix, it can be something else depending on the route
  end

  private
  # very important, methods ***below*** private are not available outside of this controller. You do not want to put the private keyword above controller actions
  # private is not a class definition nor a method and thus it does not need an 'end'
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end