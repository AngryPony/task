require 'rails_helper'

RSpec.describe 'regions/index' do
  it 'displays all the regions' do
    country = Country.all.first
    assign(:regions, [
      Region.create!(name: 'reg1', country: country),
      Region.create!(name: 'reg2', country: country)
    ])

    render

    expect(rendered).to match /reg1/
    expect(rendered).to match /reg2/
  end
end