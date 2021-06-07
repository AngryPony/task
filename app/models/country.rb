class Country < ApplicationRecord
  has_many :regions
  has_many :campsites, through: :regions

  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :regions
end
