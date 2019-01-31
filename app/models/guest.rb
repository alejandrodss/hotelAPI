class Guest < ApplicationRecord
  has_many :checks
  has_many :rooms, through: :checks
end
