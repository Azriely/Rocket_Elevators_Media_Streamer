class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :serial_number
      t.string :model
      t.string :type
      t.string :status
      t.date :date_of_commissioning
      t.date :date_of_last_inspection
      t.text :notes

      t.timestamps
    end
  end
end
