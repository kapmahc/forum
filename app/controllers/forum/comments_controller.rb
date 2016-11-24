require_dependency 'forum/application_controller'

module Forum
  class CommentsController < ApplicationController
    def hot
      @comments = Comment.order(vote: :desc).page params[:page]
      @title = t '.title'
      render 'list'
    end

    def latest
      @comments = Comment.order(updated_at: :desc).page params[:page]
      @title = t '.title'
      render 'list'
    end

    def index
      authorize Comment.new
      if current_user.is_admin?
        items = Comment.all
      else
        items = Comment.where(user_id: current_user.id)
      end
      @comments =  items.order(updated_at: :desc).page params[:page]

      render layout: 'dashboard'
    end

    def new
      @comment = Comment.new forum_article_id: params[:article_id]
      authorize @comment
    end

    def create
      @comment = Comment.new params.require(:comment).permit(:forum_article_id, :body)
      authorize @comment

      @comment.user = current_user
      if @comment.save
        redirect_to comments_path
      else
        render 'new'
      end
    end

    def edit
      @comment = Comment.find params[:id]
      authorize @comment
    end

    def update
      @comment = Comment.find params[:id]
      authorize @comment

      if @comment.update(params.require(:comment).permit(:body))
        redirect_to comments_path
      else
        render 'edit'
      end
    end

    def destroy
      @comment = Comment.find params[:id]
      authorize @comment
      @comment.destroy

      redirect_to comments_path
    end

  end
end
