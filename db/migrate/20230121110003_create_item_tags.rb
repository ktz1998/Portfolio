class CreateItemTags < ActiveRecord::Migration[6.1]
  def change
    create_table :item_tags do |t|
      t.bigint :item_id, null: false, foreign_key: true
      t.bigint :tag_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
