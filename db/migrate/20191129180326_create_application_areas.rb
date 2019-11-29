class CreateApplicationAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :application_areas do |t|
      t.string :area_name

      t.timestamps
    end
  end
end
