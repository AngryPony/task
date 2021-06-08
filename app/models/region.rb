class Region < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  belongs_to :country
  has_many :cities, dependent: :destroy
  has_many :campsites, dependent: :destroy

  accepts_nested_attributes_for :cities, :campsites
  attr_accessor :del_confirm
end
