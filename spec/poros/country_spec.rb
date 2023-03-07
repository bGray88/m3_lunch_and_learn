require 'rails_helper'

RSpec.describe 'Country' do
  it 'exists and has attributes', :vcr do
    country = CountryFacade.random_country

    expect(country).to be_a(Country)
    expect(country.name).to be_a(String)
    expect(country.capital_latitude).to be_a(Float)
    expect(country.capital_longitude).to be_a(Float)
  end
end
