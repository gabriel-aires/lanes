class Lane < ApplicationRecord
  belongs_to :board
  has_many :cards, -> { where(archived_at: nil).order(:position) }, dependent: :destroy
end
