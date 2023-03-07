require 'rails_helper'

RSpec.describe 'Countries Service' do
  it 'can return values from API', :vcr do
    countries = CountriesService.countries

    expect(countries).to be_a(Array)

    country = countries.first

    expect(country).to have_key(:name)
    expect(country).to be_a(Hash)
    expect(country[:name]).to have_key(:common)
    expect(country.dig(:name, :common)).to be_a(String)
    expect(country).to have_key(:capitalInfo)
    expect(country).to be_a(Hash)
    expect(country[:capitalInfo]).to have_key(:latlng)
    expect(country.dig(:capitalInfo, :latlng)).to be_a(Array)
    expect(country.dig(:capitalInfo, :latlng).length).to eq(2)
    expect(country.dig(:capitalInfo, :latlng).first).to be_a(Float)
    expect(country.dig(:capitalInfo, :latlng).last).to be_a(Float)
  end
end
