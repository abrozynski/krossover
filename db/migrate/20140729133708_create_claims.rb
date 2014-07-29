class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.integer :user_id
      t.integer :reward_id
      t.boolean :approved

      t.timestamps
    end
  end
end
