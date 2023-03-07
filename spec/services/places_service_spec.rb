require 'rails_helper'

RSpec.describe 'Tourist Sights Service' do
  it 'calls the service', :vcr do
    sights = TouristSightsService.search(-87.770231, 41.878968)

    expect(sights).to be_a(Hash)
    expect(sights).to have_key(:features)
    expect(sights[:features]).to be_a(Array)
    expect(sights[:features].first).to have_key(:type)
    expect(sights[:features].first).to have_key(:properties)
    expect(sights.dig(:features, 0, :properties)).to be_a(Hash)
    expect(sights.dig(:features, 0, :properties)).to have_key(:name)
    expect(sights.dig(:features, 0, :properties, :name)).to be_a(String)
    expect(sights.dig(:features, 0, :properties)).to have_key(:country)
    expect(sights.dig(:features, 0, :properties, :country)).to be_a(String)
    expect(sights.dig(:features, 0, :properties)).to have_key(:address_line2)
    expect(sights.dig(:features, 0, :properties, :address_line2)).to be_a(String)
  end
end
