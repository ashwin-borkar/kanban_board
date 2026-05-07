class BoardEvent < ApplicationRecord
  belongs_to :card
  belongs_to :column_from, class_name: 'Column', optional: true
  belongs_to :column_to, class_name: 'Column', optional: true

  validates :event_type, presence: true
  validates :timestamp, presence: true

  EVENT_TYPES = %w[card_created card_updated card_moved card_reordered card_deleted].freeze

  scope :chronological, -> { order(:timestamp) }
  scope :before_timestamp, ->(timestamp) { where('timestamp <= ?', timestamp) }
end
