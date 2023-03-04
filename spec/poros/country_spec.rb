require 'rails_helper'

RSpec.describe 'Country' do
  it 'exists and has attributes', :vcr do
    country = RestCountryFacade.random_country

    expect(country).to be_a(Country)
    expect(country.name).to be_a(String)
  end
end
