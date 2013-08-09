class IdeasController < ApplicationController
  def index
    @ideas = Idea.all.order('created_at DESC')
  end
  
  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "Seed ##{@idea.id} added to the farm"
      redirect_to @idea
    else
      render 'new'
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @comments = Comment.where(idea_id: @idea.id).order('created_at ASC').collect
  end

  def destroy
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
