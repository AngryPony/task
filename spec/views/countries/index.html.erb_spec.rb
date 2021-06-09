require 'rails_helper'

RSpec.describe 'countries/index' do
  it 'displays all the countries' do
    assign(:countries, [
      Country.create!(name: 'country1'),
      Country.create!(name: 'country2')
    ])

    render

    expect(rendered).to match /country1/
    expect(rendered).to match /country2/
  end
end