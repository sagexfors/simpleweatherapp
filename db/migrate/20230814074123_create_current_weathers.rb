class CreateCurrentWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :current_weathers do |t|
      t.float :temperature
      t.float :windspeed
      t.integer :winddirection
      t.integer :weathercode
      t.datetime :time
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
