class CreateMindCards < ActiveRecord::Migration[6.0]
  def change
    create_table :mind_cards do |t|
      t.string :title
      t.string :text
      t.string :context
      t.string :pronunciation
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
