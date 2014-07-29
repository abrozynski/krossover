class AddKreditToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kredit, :integer, :default => 0
  end
end
