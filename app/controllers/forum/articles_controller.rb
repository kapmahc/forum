require_dependency 'forum/application_controller'

module Forum
  class ArticlesController < ApplicationController
    def hot
      @articles = Article.select(:id, :updated_at, :title, :summary).order(vote: :desc).page params[:page]
      @title = t '.title'
      render 'list'
    end

    def latest
      @articles = Article.select(:id, :updated_at, :title, :summary).order(updated_at: :desc).page params[:page]
      @title = t '.title'
      render 'list'
    end

    def index
      authorize Article.new
      if current_user.is_admin?
        items = Article.all
      else
        items = Article.where(user_id: current_user.id)
      end
      @articles =  items.select(:id, :title, :updated_at).order(updated_at: :desc).page params[:page]

      render layout: 'dashboard'
    end

    def new
      @article = Article.new
      authorize @article
    end

    def create
      @article = Article.new article_params
      authorize @article
      puts '###'*80, @article.inspect

      @article.lang = I18n.locale
      @article.user = current_user
      if @article.save
        redirect_to articles_path
      else
        render 'new'
      end
    end

    def show
      @article = Article.find params[:id]
    end

    def edit
      @article = Article.find params[:id]
      authorize @article
    end

    def update
      @article = Article.find params[:id]
      authorize @article

      if @article.update(article_params)
        redirect_to articles_path
      else
        render 'edit'
      end
    end

    def destroy
      @article = Article.find params[:id]
      authorize @article
      @article.destroy

      redirect_to articles_path
    end

    protected
    def article_params
      params.require(:article).permit(:title, :body, :summary, tag_ids: [])
    end
  end
end
