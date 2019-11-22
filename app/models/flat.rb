class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :location, presence: true
  validates :price_per_night, presence: true
  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  include PgSearch::Model
  pg_search_scope :search_by_location_and_capacity, against: [:location, :capacity],
    using: {
      tsearch: { prefix: true }
    }
end
