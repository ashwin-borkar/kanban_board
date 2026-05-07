class Card < ApplicationRecord
  belongs_to :column
  has_many :board_events, dependent: :destroy

  validates :title, presence: true
  validates :position, presence: true

  scope :ordered, -> { order(:position) }
end
