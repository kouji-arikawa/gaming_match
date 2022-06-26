class AddEntryPermitionToCustomerContributions < ActiveRecord::Migration[6.1]
  def change
    add_column :customer_contributions, :status, :integer
  end
end
