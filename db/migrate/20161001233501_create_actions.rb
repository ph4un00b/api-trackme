class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.string :description
      t.string :cycles
      t.string :cycle_type
      t.string :feeling
      t.string :schedule

      t.timestamps
    end
  end
end
