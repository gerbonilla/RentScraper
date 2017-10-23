class CreateFlats < ActiveRecord::Migration[5.1]
  def change
    create_table :flats do |t|
      t.string :description
      t.string :address
      t.float :size
      t.float :rooms
      t.string :source
      t.integer :source_id
      t.string :tags, array: true, default: []
      t.integer :rent_cents

      t.timestamps
    end
  end
end
