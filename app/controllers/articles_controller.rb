# == Schema Information
#
# Table name: articles
#
#  id                      :integer          not null, primary key
#  title                   :string
#  body                    :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  blog_image_file_name    :string
#  blog_image_content_type :string
#  blog_image_file_size    :integer
#  blog_image_updated_at   :datetime
#

class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update


    if @article.update_attributes(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy

    if @article.destroy
      redirect_to articles_path
    else
      redirect_to @article
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :blog_image, :tag_list)
  end

end
