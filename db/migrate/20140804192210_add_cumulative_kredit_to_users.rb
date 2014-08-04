class AddCumulativeKreditToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cumulative_kredit, :integer, :default => 0
  end
end
