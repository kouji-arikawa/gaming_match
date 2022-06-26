class Public::CustomerContributionsController < ApplicationController
  def create
    contribution = Contribution.find(params[:contribution_id])
    CustomerContribution.create(customer_id: current_customer.id, contribution_id: contribution.id, status: :request)
    redirect_to contribution_path(contribution.id)
  end

  def destroy
    contribution = Contribution.find(params[:id])
    customer_contribution = CustomerContribution.find_by(customer_id: current_customer.id, contribution_id: contribution.id)
    customer_contribution.destroy
    redirect_to contributions_path
  end

  def change_status
    customer_contribution = CustomerContribution.find(params[:id])
      if params[:status] == "approval"
        customer_contribution.update(status: 1)
      elsif params[:status] == "rejection"
        customer_contribution.update(status: 2)
      end
      redirect_to contribution_path(customer_contribution.contribution_id)
  end
end
