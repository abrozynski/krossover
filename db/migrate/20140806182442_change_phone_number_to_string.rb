class ChangePhoneNumberToString < ActiveRecord::Migration
  def change
    change_column :referrals, :phone_number, :string
  end
end
