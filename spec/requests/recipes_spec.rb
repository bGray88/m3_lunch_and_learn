require 'rails_helper'

RSpec.describe 'Recipes' do
  it 'can get recipe based on name' do
    get api_v1_recipes_path(search: 'thailand')

    expect(response).to be_successful
  end
end
