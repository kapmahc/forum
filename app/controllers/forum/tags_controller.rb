require_dependency 'forum/application_controller'

module Forum
  class TagsController < ApplicationController
    def hot
      @tags = Tag.order(vote: :desc)
    end

    def index
      authorize Tag.new
      @tags = Tag.order(updated_at: :desc)
      render layout: 'dashboard'
    end

    def new
      @tag = Tag.new
      authorize @tag
    end

    def create
      @tag = Tag.new tag_params
      authorize @tag

      @tag.lang = I18n.locale
      if @tag.save
        redirect_to tags_path
      else
        render 'new'
      end
    end

    def edit
      @tag = Tag.find params[:id]
      authorize @tag
    end

    def update
      @tag = Tag.find params[:id]
      authorize @tag

      if @tag.update(tag_params)
        redirect_to tags_path
      else
        render 'edit'
      end
    end

    def destroy
      @tag = Tag.find params[:id]
      authorize @tag
      @tag.destroy

      redirect_to tags_path
    end

    protected
    def tag_params
      params.require(:tag).permit(:name)
    end
  end
end
