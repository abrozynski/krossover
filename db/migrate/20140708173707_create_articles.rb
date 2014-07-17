class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :text
      t.string :date
      t.integer :kredit

      t.timestamps
    end
  end
end
