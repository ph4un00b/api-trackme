class CreateMetainfos < ActiveRecord::Migration[5.0]
  def change
    create_table :metainfos do |t|
      t.string :user
      t.string :meta_type
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
