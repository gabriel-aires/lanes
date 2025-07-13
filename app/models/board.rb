class Board < ApplicationRecord
  has_many :lanes, -> { order(:position) }, dependent: :destroy
end
