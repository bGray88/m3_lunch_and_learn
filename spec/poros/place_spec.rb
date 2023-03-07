require 'rails_helper'

RSpec.describe 'Place' do
  it 'exists and has attributes', :vcr do
    place = Place.new(
      properties: {
        name: "Brazil",
        address_line2: "Some Place Downtown",
        place_id: User.random_key
      }
    )

    expect(place).to be_a(Place)
    expect(place.name).to be_a(String)
    expect(place.address).to be_a(String)
    expect(place.place_id).to be_a(String)
    expect(place.place_id.length).to eq(32)
  end
end
