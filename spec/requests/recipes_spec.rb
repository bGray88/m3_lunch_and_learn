require 'rails_helper'

RSpec.describe 'Recipes' do
  it 'can get recipe based on name' do
    get api_v1_recipes_path(search: 'thailand')

    expect(response).to be_successful

    get api_v1_recipes_path(search: 'dhkfhlaksdhl')

    expect(response).to be_successful
    expect(JSON.parse(response.body, symbolize_names: true)).to eq({ data: [] })
  end
end
