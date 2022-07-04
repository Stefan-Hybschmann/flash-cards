class Pack < ApplicationRecord
  has_many :mind_cards, dependent: :destroy

  validates :title, presence: true

  accepts_nested_attributes_for :mind_cards, allow_destroy: true
end
