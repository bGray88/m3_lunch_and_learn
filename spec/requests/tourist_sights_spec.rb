require 'rails_helper'

RSpec.describe 'Tourist Sights' do
  describe '#index' do
    it 'can get list of sights based on country parameter passed', :vcr do
      get api_v1_tourist_sights_path(country: "Gambia")

      sights = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(sights).to be_a(Hash)
      expect(sights).to have_key(:data)
      expect(sights[:data]).to be_a(Array)
      expect(sights[:data].first).to have_key(:type)
      expect(sights[:data].first[:type]).to eq("tourist_sight")
      expect(sights[:data].first).to have_key(:attributes)
      expect(sights[:data].first[:attributes]).to be_a(Hash)
      expect(sights[:data].first[:attributes]).to have_key(:name)
      expect(sights[:data].first[:attributes]).to have_key(:address)
      expect(sights[:data].first[:attributes]).to have_key(:place_id)
      expect(sights).to_not have_key(:properties)
      expect(sights).to_not have_key(:geometry)
    end
  end
end
