class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.integer :user_id, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :rate, null: false
      t.text :review, null: false
      t.timestamps
    end
  end
end
