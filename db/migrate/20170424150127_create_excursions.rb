class CreateExcursions < ActiveRecord::Migration
  def change
    create_table :excursions do |t|
      t.string :ename, null: false
      t.references :city, index: true, foreign_key: true, null: false
      t.text :edesc
      t.integer :eprice, null: false

      t.timestamps null: false
    end
  end
end
