class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.references :route, index: true, foreign_key: true, null: false
      t.date :tdate, null: false
      t.integer :days, null: false
      t.integer :payment
      t.text :tdesc

      t.timestamps null: false
    end
  end
end
