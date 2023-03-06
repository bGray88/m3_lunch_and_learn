require 'rails_helper'

RSpec.describe 'Places Service' do
  it 'calls the service', :vcr do
    response = PlacesService.search(-87.770231, 41.878968)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:features)
    expect(response[:features]).to be_a(Array)
    expect(response[:features].first).to have_key(:type)
    expect(response[:features].first).to have_key(:properties)
    expect(response.dig(:features, 0, :properties)).to be_a(Hash)
    expect(response.dig(:features, 0, :properties)).to have_key(:name)
    expect(response.dig(:features, 0, :properties, :name)).to be_a(String)
    expect(response.dig(:features, 0, :properties)).to have_key(:country)
    expect(response.dig(:features, 0, :properties, :country)).to be_a(String)
    expect(response.dig(:features, 0, :properties)).to have_key(:address_line2)
    expect(response.dig(:features, 0, :properties, :address_line2)).to be_a(String)
  end
end
