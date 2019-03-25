class ArticlesController < ApplicationController

# index, show, search以外は一般ユーザーでアクセスできない
before_action :admin_authorize, :except => [:index, :show, :search]

  # 記事一覧
  def index
    @articles = Article.all
  end

  # 新規記事作成
  def new
    @article = Article.new
  end

  # 記事詳細
  def show
    @article = Article.find(params[:id])
  end

  # 記事編集
  def edit
    @article = Article.find(params[:id])
  end

  # 記事検索
  def search
    if params[:search].blank?
      @articles = Article.all
    else
      @articles = Article.search(params)
    end
  end

  # 記事更新
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  # 記事投稿
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  # 記事削除
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

# タイトルと記事の中身の値をプライベートにセット
private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
