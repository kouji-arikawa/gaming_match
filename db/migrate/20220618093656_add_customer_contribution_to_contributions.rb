class AddCustomerContributionToContributions < ActiveRecord::Migration[6.1]
  def change
    add_column :contributions, :customer_contribution, :integer
  end
end
