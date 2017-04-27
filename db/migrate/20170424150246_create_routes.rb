class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :rname, null: false
      t.references :city, index: true, foreign_key: true, null: false
      t.text :rdesc
      t.integer :rprice, null: false

      t.timestamps null: false
    end
  end
end
