class Campsite < ApplicationRecord
  belongs_to :city
  belongs_to :region
end
