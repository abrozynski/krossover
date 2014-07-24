class AddKreditsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kredits, :integer, default: 0
  end
end
