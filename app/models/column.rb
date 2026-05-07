class Column < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :board_events_as_from, class_name: 'BoardEvent', foreign_key: :column_from_id
  has_many :board_events_as_to, class_name: 'BoardEvent', foreign_key: :column_to_id

  validates :name, presence: true
  validates :position, presence: true, uniqueness: true

  scope :ordered, -> { order(:position) }
end
