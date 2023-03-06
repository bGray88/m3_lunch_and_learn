require 'rails_helper'

RSpec.describe 'Rest Country Service' do
  it 'can return values from API', :vcr do
    countries = RestCountryService.countries

    expect(countries.first).to have_key(:name)
    expect(countries.first).to be_a(Hash)
    expect(countries.first[:name]).to have_key(:common)
    expect(countries.first.dig(:name, :common)).to be_a(String)
  end
end
