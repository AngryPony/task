class City < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }

  belongs_to :region

  has_many :campsites, dependent: :nullify

  accepts_nested_attributes_for :campsites

end
