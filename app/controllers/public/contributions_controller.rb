class Public::ContributionsController < ApplicationController

  def new
    @contribution = Contribution.new
  end

  def create
    contribution = Contribution.new(contribution_params)
    contribution.customer = current_customer
    #byebug
    contribution.save
    redirect_to contributions_path
  end

  def index
    @contributions = Contribution.all
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
    params.require(:contribution).permit(:customer_id, :genre_id, :recruitment_numbers, :content)
  end
end
