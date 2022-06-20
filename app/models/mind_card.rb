class MindCard < ApplicationRecord
  extend Mobility
  translates :text, :context, :pronunciation

  belongs_to :pack

  validates :title, presence: true
end
