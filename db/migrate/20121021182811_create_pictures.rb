class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :item
      t.attachment :picture
      t.timestamps
    end
    add_index :pictures, :item_id
  end
end
