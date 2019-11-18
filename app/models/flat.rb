class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :location, presence: true
  validates :price_per_night, presence: true
  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true
  validates :rating, presence: true
end
