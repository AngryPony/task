require 'rails_helper'

RSpec.describe City, type: :model do

  context 'create' do

    it 'valid create' do
      region = Region.all.first
      city = City.new({region: region, name: 'City' })
      expect(city.save).to be true
    end

    it 'empty name' do
      city = City.new
      expect(city.save).to be false
    end

    it 'name too short' do
      region = Region.all.first
      city = City.new({region: region, name: 'C' })
      expect(city.save).to be false
    end

    it 'without region' do
      city = City.new({region: nil, name: 'City' })
      expect(city.save).to be false
    end
  end

  context 'delete' do

    before(:each) do
      @city = City.all.first
    end

    it 'delete single city' do

      city_id = @city.id
      @city.destroy
      expect(City.find_by(id: city_id).nil?).to be true
    end

    it 'delete city, campsite must be deleted too' do
      region = Region.all.first
      campsite = Campsite.new({region: region, city: @city, name: 'camp'})
      campsite.save
      campsite_id = campsite.id
      expect(Campsite.find(campsite_id).city.nil?).to be false
      @city.destroy
      expect(Campsite.find(campsite_id).city.nil?).to be true
    end

  end

end