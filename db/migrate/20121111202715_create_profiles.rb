class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :gender
      t.text :bio
      t.references :user

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
