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
    if params[:contribution][:genre_id].present? #contributionがあれば（blank　なければ）
      @contributions = Contribution.where(genre_id: params[:contribution][:genre_id])
    end
  end

  def show
    @contribution = Contribution.find(params[:id])
    @customer_contributions = @contribution.customer_contributions.where.not(status: :rejection)
  end

  def edit
    @contribution = Contribution.find(params[:id])
    current_customer == @contribution.customer
  end

  def update
    @contribution = Contribution.find(params[:id])
    @contribution.update(contribution_params)
    redirect_to edit_contribution_path(@contribution.id)
  end

  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    redirect_to contributions_path
  end

  private
  def contribution_params
    params.require(:contribution).permit(:customer_id, :genre_id, :recruitment_numbers, :content)
  end
end
