require 'rails_helper'

RSpec.describe 'Countries Serializer' do
  it 'returns hash of recipe data formatted with needed data', :vcr do
    country = CountriesSerializer.country(RestCountryFacade.random_country)

    expect(country).to have_key(:data)
    expect(country[:data].first).to have_key(:id)
    expect(country.dig(:data, 0, :id)).to eq(nil)
    expect(country.dig(:data, 0, :attributes)).to have_key(:name)
    expect(country.dig(:data, 0, :attributes, :title)).to be_a(String)
    expect(country.dig(:data, 0, :attributes)).to_not have_key(:currency)
    expect(country.dig(:data, 0, :attributes)).to_not have_key(:borders)
  end
end
