class AddUserLastNameToClaim < ActiveRecord::Migration
  def change
    add_column :claims, :user_last_name, :string
  end
end
