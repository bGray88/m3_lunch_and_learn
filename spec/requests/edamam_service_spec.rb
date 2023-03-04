require 'rails_helper'

RSpec.describe 'Edamam Service' do
  it 'calls the service' do
    response = EdamamService.search('chicken').dig(:hits, 0)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:recipe)
    expect(response[:recipe]).to be_a(Hash)
    expect(response[:recipe]).to have_key(:label)
    expect(response.dig(:recipe, :label)).to be_a(String)
  end
end
