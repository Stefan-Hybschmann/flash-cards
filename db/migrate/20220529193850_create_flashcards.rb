class CreateFlashcards < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcards do |t|
      t.string :title
      t.string :text
      t.string :context
      t.string :pronunciation
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
