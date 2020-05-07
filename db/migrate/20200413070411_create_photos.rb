class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :image_id
      t.string :image_type
      t.string :name
      t.timestamps
    end
  end
end
