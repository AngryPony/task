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
end