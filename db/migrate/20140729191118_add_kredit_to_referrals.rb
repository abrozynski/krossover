class AddKreditToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :kredit, :integer, :default => 10
  end
end
