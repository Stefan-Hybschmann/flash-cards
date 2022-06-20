class CreatePack < ActiveRecord::Migration[6.0]
  def change
    create_table :packs do |t|
      t.string :title
      t.string :description
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
