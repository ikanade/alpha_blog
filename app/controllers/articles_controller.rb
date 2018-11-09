class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    # redirect_to article_show(@article)
    if @article.save
      flash[:notice] = "Article Created"
      redirect_to articles_path(@article)
    else
      render 'new'
    end
    
  end
  
  def show
      
    @article = Article.find(params[:id])
    
  end
  private
  
  def article_params
    
    params.require(:article).permit(:title, :description)
  
  end
  
  
end
