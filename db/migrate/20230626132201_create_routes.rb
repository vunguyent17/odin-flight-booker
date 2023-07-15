class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.references :airport_from, null: false, foreign_key: {to_table: :airports}
      t.references :airport_to, null: false, foreign_key: {to_table: :airports}
      t.integer :duration

      t.timestamps
    end
  end
end
