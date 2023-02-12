class Property < ApplicationRecord

  validates :name,  presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :lat, presence: true, numericality: { less_than_or_equal_to: 90, greater_than_or_equal_to: -90  }
  validates :long, presence: true, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180  }
end
