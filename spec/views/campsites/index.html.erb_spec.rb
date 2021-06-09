require 'rails_helper'

RSpec.describe 'camp_sites/index' do
  it 'displays all the campsites' do
    region = Region.all.first
    assign(:campsites, [
      Campsite.create!(name: 'camp1', region: region),
      Campsite.create!(name: 'camp2', region: region)
    ])

    render

    expect(rendered).to match /camp1/
    expect(rendered).to match /camp2/
  end
end