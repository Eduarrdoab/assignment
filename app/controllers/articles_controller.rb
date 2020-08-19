class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(params_article)
        if @article.save
            flash[:notice] = "Article successfully created."
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        if @article.update(params_article)
            flash[:notice] = "Article successfully edited."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        if @article.destroy
            flash[:notice] = "Article successfully deleted"
            redirect_to @article
        end
    end

    private

    def find_article
        @article = Article.find(params[:id])
    end

    def params_article
        params.require(:article).permit(:title, :description)
    end

end