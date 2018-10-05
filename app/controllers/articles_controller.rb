class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_param)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_param)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destory
    @article = Article.find(params[:id])
    @article.destory

    redirect_to articles_path
  end

  private
    def article_param
      params.require(:article).permit(:title, :text)
    end

end