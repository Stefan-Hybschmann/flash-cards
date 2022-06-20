class Set < ApplicationRecord
  has_many :mind_cards, dependent: :destroy

  validates :title, presence: true
end
