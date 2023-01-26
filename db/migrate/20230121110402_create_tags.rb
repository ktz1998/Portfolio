class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags, id: :integer do |t|
      t.string :tag_name

      t.timestamps
    end
  end
end
