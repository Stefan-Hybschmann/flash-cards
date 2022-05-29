class CreateFlashcards < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcards do |t|
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
