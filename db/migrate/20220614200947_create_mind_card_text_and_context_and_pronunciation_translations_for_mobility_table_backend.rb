class CreateMindCardTextAndContextAndPronunciationTranslationsForMobilityTableBackend < ActiveRecord::Migration[6.0]
  def change
    create_table :mind_card_translations do |t|

      # Translated attribute(s)
      t.string :text
      t.string :context
      t.string :pronunciation

      t.string  :locale, null: false
      t.references :mind_card, null: false, foreign_key: true, index: false

      t.timestamps null: false
    end

    add_index :mind_card_translations, :locale, name: :index_mind_card_translations_on_locale
    add_index :mind_card_translations, [:mind_card_id, :locale], name: :index_mind_card_translations_on_mind_card_id_and_locale, unique: true

  end
end
