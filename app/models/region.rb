class Region < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  belongs_to :country
  has_many :cities

  accepts_nested_attributes_for :cities
end
