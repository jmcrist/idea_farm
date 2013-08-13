class IdeasController < ApplicationController
  def index
    @ideas = Idea.all.order('created_at DESC')
  end

  def flagged_index
    @ideas = Idea.all.where(flag: true)
  end

  def comments_index
  end

  def new
    @idea = Idea.new
  end

  def create
    @user = @current_user
    @idea = @user.ideas.build(idea_params)
    if @idea.save
      flash[:success] = "Idea ##{@idea.id} added to the farm"
      redirect_to @idea
    else
      render 'new'
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def show
    @idea = Idea.find(params[:id])
    @comments = Comment.where(idea_id: @idea.id).order('created_at ASC').collect
  end

  def destroy
    Idea.find(params[:id]).destroy
    flash[:success] = "Idea toasted."
    redirect_to ideas_path
  end

  def flag
    @idea = Idea.find(params[:id])
    @idea.toggle!(:flag)
    redirect_to @idea
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description, :product_type, :market, :profit, :loe, :solves)
    end
end
