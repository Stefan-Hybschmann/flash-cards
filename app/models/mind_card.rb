class MindCard < ApplicationRecord
  extend Mobility
  translates :text, :context, :pronunciation

  belongs_to :set

  validates :title, presence: true
end
