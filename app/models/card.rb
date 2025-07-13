class Card < ApplicationRecord
  belongs_to :lane

  delegate :board, to: :lane

  scope :active,   -> { where(archived_at: nil) }
  scope :archived, -> { where.not(archived_at: nil) }
end
