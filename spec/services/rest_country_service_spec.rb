require 'rails_helper'

RSpec.describe 'Rest Country Service' do
  it 'can return values from API', :vcr do
    countries = RestCountryService.random_country

    expect(countries).to have_key(:name)
    expect(countries).to be_a(Hash)
    expect(countries[:name]).to have_key(:common)
    expect(countries.dig(:name, :common)).to be_a(String)
  end
end
