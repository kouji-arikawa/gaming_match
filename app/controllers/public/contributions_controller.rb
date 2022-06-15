class Public::ContributionsController < ApplicationController

  def new
    @contribution = Contribution.new
  end

  def create
    contribution = Contribution.new(contribution_params)
    contribution.save
    redirect_to new_contribution_path
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def contribution_params
    params.require(:contribution).permit(:customer_id, :genre_id, :recruitment_numbers, :contribution)
  end
end
