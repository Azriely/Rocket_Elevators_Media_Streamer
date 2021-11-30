class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :building, foreign_key: true
      t.belongs_to :battery, foreign_key: true
      t.belongs_to :column, foreign_key: true
      t.belongs_to :elevator, foreign_key: true
      t.belongs_to :employee, foreign_key: true

      t.timestamps
    end
  end
end
