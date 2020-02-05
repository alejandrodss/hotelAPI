class Check < ApplicationRecord
  enum status: [:pending, :closed]

  belongs_to :guest
  belongs_to :room
end
