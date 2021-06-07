class Campsite < ApplicationRecord
  belongs_to :city, optional: true
  belongs_to :region
end
