class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]

  def index
    if params[:search].present?
      searched_articles = Article.where('lower(title) LIKE ?', "%#{params[:search].downcase}%")
      if searched_articles.any?
        render json: searched_articles.to_json, status: 200
      else
        render json: { alert: " No articles match your search of #{params[:search]}"}
      end
    else
      articles = Article.all
      if articles.any?
        render json: articles.to_json, status: 200
      else
        render json: { alert: "There are no articles in the system yet add a new one or seed the database" }
      end
    end
  end

  def show
    render json: @article.to_json
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article.to_json, status: 201
    else
      render json: { errors: article.errors.to_json }, status: 400
    end
  end

  def destroy

  end

  private

  def set_article
    @article = Article.find_by(id: params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
