require 'rails_helper'

RSpec.describe 'cities/index' do
  it 'displays all the cities' do
    region = Region.all.first
    assign(:cities, [
      City.create!(name: 'city1', region: region),
      City.create!(name: 'city2', region: region)
    ])

    render

    expect(rendered).to match /city1/
    expect(rendered).to match /city2/
  end
end