class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :engine
      t.boolean :new
      t.references :make, null: false, foreign_key: true

      t.timestamps
    end
  end
end
