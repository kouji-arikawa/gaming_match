class CreateContributions < ActiveRecord::Migration[6.1]
  def change
    create_table :contributions do |t|
      t.integer "customer_id"
      t.integer "genre_id"
      t.integer "recruitment_numbers"
      t.text "contribution"

      t.timestamps
    end
  end
end
