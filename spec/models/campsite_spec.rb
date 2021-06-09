require 'rails_helper'

RSpec.describe Campsite, type: :model do

  context 'create' do

    it 'valid create with city' do
      region = Region.all.first
      city = City.all.first
      campsite = Campsite.new({region: region, city: city, name: 'Campsite' })
      expect(campsite.save).to be true
    end

    it 'valid create without city' do
      region = Region.all.first
      campsite = Campsite.new({region: region, name: 'Campsite' })
      expect(campsite.save).to be true
      expect(campsite.city_id.nil?).to be true
    end

    it 'empty name' do
      region = Region.all.first
      campsite = Campsite.new({region: region })
      expect(campsite.save).to be false
    end

    it 'name too short' do
      region = Region.all.first
      campsite = Campsite.new({region: region, name: 'C' })
      expect(campsite.save).to be false
    end

    it 'without region' do
      campsite = Campsite.new({region: nil, name: 'Campsite' })
      expect(campsite.save).to be false
    end

    it 'without region, with city' do
      city = City.all.first
      campsite = Campsite.new({region: nil,city: city, name: 'Campsite' })
      expect(campsite.save).to be false
    end
  end

  context 'delete' do

    it 'delete single campsite' do
      campsite = Campsite.all.first
      campsite_id = campsite.id
      campsite.destroy
      expect(Campsite.find_by(id: campsite_id).nil?).to be true
    end
  end

end