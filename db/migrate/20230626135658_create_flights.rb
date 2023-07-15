class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :route, null: false, foreign_key: {to_table: :routes}
      t.datetime :departure_time

      t.timestamps
    end
  end
end
