class Guest < ApplicationRecord
  enum member_tier: [:unranked, :bronze, :silver, :gold]

  has_many :checks
  has_many :rooms, through: :checks
end
