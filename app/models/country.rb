class Country < ApplicationRecord
  has_many :regions, dependent: :destroy
  has_many :campsites, through: :regions

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }

  accepts_nested_attributes_for :regions
  attr_accessor :del_confirm
end
