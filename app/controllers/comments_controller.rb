class CommentsController < ApplicationController

before_action :authorize, :only => [:create]
before_action :admin_authorize, :only => [:destroy]

  def create
    @article = Article.find_by(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.save
      redirect_to article_path(@article), notice: "コメントを投稿しました"
    else
      redirect_to article_path(@article), alert: "コメントを投稿できませんでした。"
  end

  def destroy
    @article = Article.find_by(params[:article_id])
    @comment = @article.comments.find_by(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
