class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article # = #articles_url(@article.id) = #"articles/#{@article.id}" #이렇게 3개가 다 같다.
  end
  
  def show
  end

  def index
    @articles = Article.all
  end

  def edit
  end
  
  def update
    @article.update(article_params)
    redirect_to @article
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
