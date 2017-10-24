class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.references :flat, foreign_key: true
      t.string :rent_cents
      t.date :date

      t.timestamps
    end
  end
end
