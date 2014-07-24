class AddDetailsToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :last_name, :string
    add_column :referrals, :phone_number, :integer
    add_column :referrals, :school, :string
    add_column :referrals, :sport, :string
  end
end
