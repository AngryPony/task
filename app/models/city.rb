class City < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }

  belongs_to :region

  has_many :campsites

  accepts_nested_attributes_for :campsites
end
