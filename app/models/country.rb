class Country < ApplicationRecord
  has_many :regions, dependent: :destroy # for cs destroy (1)
  has_many :campsites, through: :regions

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :regions
  attr_accessor :del_confirm
end
