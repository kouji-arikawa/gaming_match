class RemoveContributionFromContributions < ActiveRecord::Migration[6.1]
  def change
    remove_column :contributions, :contribution, :text
  end
end
