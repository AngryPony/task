require 'rails_helper'

RSpec.describe Country, type: :model do

  context 'create' do

    it 'valid create' do
      country = Country.new({ name: 'Rus' })
      expect(country.save).to equal true
    end

    it 'empty name' do
      country = Country.new
      expect(country.save).to equal false
    end

    it 'name too short' do
      country = Country.new({ name: 'R' })
      expect(country.save).to equal false
    end

    it 'name too long' do
      country = Country.new({ name: 'TestTooLongCountryFalseToCreate' })
      expect(country.save).to equal false
    end
  end

  context 'delete' do

    before(:each) do
      @country = Country.all.first
    end

    it 'delete single country' do
      country_id = @country.id
      @country.destroy
      expect(Country.find_by(id: country_id).nil?).to be true
    end

    it 'cascade delete with region' do
      region = Region.new({country: @country, name: 'region'})
      region.save
      region_id = region.id
      expect(Region.find_by(id: region_id).nil?).to be false
      @country.destroy
      expect(Region.find_by(id: region_id).nil?).to be true
    end

  end

end