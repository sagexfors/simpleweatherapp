class CreateHourlyForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :hourly_forecasts do |t|
      t.references :location, null: false, foreign_key: true
      t.json :data

      t.timestamps
    end
  end
end
