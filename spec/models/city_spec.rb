require 'rails_helper'

RSpec.describe City, type: :model do

  context 'create' do

    it 'valid create' do
      region = Region.all.first
      city = City.new({region: region, name: 'City' })
      expect(city.save).to equal true
    end

    it 'empty name' do
      city = City.new
      expect(city.save).to equal false
    end

    it 'name too short' do
      region = Region.all.first
      city = City.new({region: region, name: 'C' })
      expect(city.save).to equal false
    end

    it 'without region' do
      city = City.new({region: nil, name: 'City' })
      expect(city.save).to equal false
    end
  end

end