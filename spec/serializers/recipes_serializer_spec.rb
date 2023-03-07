require 'rails_helper'

RSpec.describe 'Recipes Serializer' do
  it 'returns hash of recipe data formatted with needed data', :vcr do
    recipe = RecipeFacade.recipes('thailand')

    expect(recipe).to have_key(:data)
    expect(recipe[:data].first).to have_key(:id)
    expect(recipe.dig(:data, 0, :id)).to eq(nil)
    expect(recipe.dig(:data, 0, :attributes)).to have_key(:title)
    expect(recipe.dig(:data, 0, :attributes, :title)).to be_a(String)
    expect(recipe.dig(:data, 0, :attributes)).to have_key(:url)
    expect(recipe.dig(:data, 0, :attributes, :url)).to be_a(String)
    expect(recipe.dig(:data, 0, :attributes)).to have_key(:country)
    expect(recipe.dig(:data, 0, :attributes, :country)).to be_a(String)
    expect(recipe.dig(:data, 0, :attributes)).to have_key(:image)
    expect(recipe.dig(:data, 0, :attributes, :image)).to be_a(String)
    expect(recipe.dig(:data, 0, :attributes)).to have_key(:title)
    expect(recipe.dig(:data, 0, :attributes)).to_not have_key(:dietLabels)
    expect(recipe.dig(:data, 0, :attributes)).to_not have_key(:healthLabels)
  end
end
