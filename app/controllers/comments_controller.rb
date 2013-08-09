class CommentsController < ApplicationController
  def new
    @idea = Idea.find(params[:idea_id])
    @comment = Comment.new
  end

  def create
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.build(params[:comment].permit(:name, :comment))
    @comment.save

    redirect_to idea_path(@idea.id)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @idea = Idea.find(params[:idea_id])
    @comments = Comment.where(idea_id: @idea.id).order('created_at ASC').collect
  end

  def edit
  end

  def update
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :comment)
    end
end
