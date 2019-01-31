class Room < ApplicationRecord
  has_many :checks
  has_many :guests, through: :checks
end
