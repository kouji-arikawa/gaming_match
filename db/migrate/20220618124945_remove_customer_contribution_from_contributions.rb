class RemoveCustomerContributionFromContributions < ActiveRecord::Migration[6.1]
  def change
    remove_column :contributions, :customer_contribution, :integer
  end
end
