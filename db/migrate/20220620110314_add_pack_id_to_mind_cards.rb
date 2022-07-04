class AddPackIdToMindCards < ActiveRecord::Migration[6.0]
  def change
    add_column :mind_cards, :pack_id, :integer
  end
end
