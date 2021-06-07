class Country < ApplicationRecord
  has_many :regions

  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :regions
end
