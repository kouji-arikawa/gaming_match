class Public::CustomerContributionsController < ApplicationController
  def create
    contribution = Contribution.find(params[:contribution_id])
    CustomerContribution.create(customer_id: current_customer.id, contribution_id: contribution.id)
    redirect_to contribution_path(contribution.id)
  end

  def destroy
    contribution = Contribution.find(params[:id])
    customer_contribution = CustomerContribution.find_by(customer_id: current_customer.id, contribution_id: contribution.id)
    customer_contribution.destroy
    redirect_to contributions_path
  end
end
