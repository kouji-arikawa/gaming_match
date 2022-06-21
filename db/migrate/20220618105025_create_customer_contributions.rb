class CreateCustomerContributions < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_contributions do |t|
      t.integer :customer_id
      t.integer :contribution_id

      t.timestamps
    end
  end
end
