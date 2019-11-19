class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :location, presence: true
  validates :price_per_night, presence: true
  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true
end
