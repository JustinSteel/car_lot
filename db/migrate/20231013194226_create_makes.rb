class CreateMakes < ActiveRecord::Migration[7.0]
  def change
    create_table :makes do |t|
      t.string :name
      t.integer :year
      t.boolean :american

      t.timestamps
    end
  end
end
