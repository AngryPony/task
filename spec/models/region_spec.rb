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

  context 'delete' do

    before(:each) do
      @region = Region.all.first
    end

    it 'delete single region' do
      region_id = @region.id
      @region.destroy
      expect(Region.find_by(id: region_id).nil?).to be true
    end

    it 'cascade delete with city' do
      city = City.new({region: @region, name: 'city'})
      city.save
      city_id = city.id
      expect(City.find_by(id: city_id).nil?).to be false
      @region.destroy
      expect(City.find_by(id: city_id).nil?).to be true
    end

    it 'cascade delete with campsite' do
      campsite = Campsite.new({region: @region, name: 'camp'})
      campsite.save
      campsite_id = campsite.id
      expect(Campsite.find_by(id: campsite_id).nil?).to be false
      @region.destroy
      expect(Campsite.find_by(id: campsite_id).nil?).to be true
    end

  end

end