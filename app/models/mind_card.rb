class MindCard < ApplicationRecord
  extend Mobility
  validates :title, presence: true
  translates :text, :context, :pronunciation
end
