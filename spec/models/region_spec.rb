require 'rails_helper'

RSpec.describe Region, type: :model do

  context 'create' do

    it 'valid create' do
      country = Country.all.first
      region = Region.new({country: country,name: 'Region' })
      expect(region.save).to equal true
    end

    it 'empty name' do
      region = Region.new
      expect(region.save).to equal false
    end

    it 'name too short' do
      country = Country.all.first
      region = Region.new({country: country,name: 'R' })
      expect(region.save).to equal false
    end

    it 'without country' do
      region = Region.new({country: nil,name: 'Region' })
      expect(region.save).to equal false
    end
  end

end