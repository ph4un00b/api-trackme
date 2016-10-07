class CreateFakes < ActiveRecord::Migration[5.0]
  def change
    create_table :fakes do |t|
      t.string :name

      t.timestamps
    end
  end
end
