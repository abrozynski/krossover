class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :name
      t.string :email
      t.integer :user_id
    end
  end
end
