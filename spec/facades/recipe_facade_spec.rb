require 'rails_helper'

RSpec.describe 'Recipe Facade' do
  it 'can return recipes from a specific country', :vcr do
    recipes = RecipeFacade.recipes("gambia")

    expect(recipes).to have_key(:data)
    expect(recipes[:data]).to be_a(Array)
    expect(recipes[:data].first).to have_key(:attributes)
    expect(recipes[:data].first).to have_key(:type)
    expect(recipes[:data].first).to have_key(:id)
    expect(recipes.dig(:data, 0, :attributes)).to be_a(Hash)
    expect(recipes.dig(:data, 0, :attributes)).to have_key(:country)
    expect(recipes.dig(:data, 0, :attributes, :country)).to be_a(String)
    expect(recipes.dig(:data, 0, :attributes)).to have_key(:image)
    expect(recipes.dig(:data, 0, :attributes, :image)).to be_a(String)
  end

  it 'can return recipes from a random country', :vcr do
    recipes = RecipeFacade.recipes(nil)

    expect(recipes[:data]).to be_a(Array)
    expect(recipes[:data].first).to be_a(Recipe)
    expect(recipes[:data].first.title).to be_a(String)
  end

  it 'can return empty json if empty string passed in', :vcr do
    recipes = RecipeFacade.recipes("")

    expect(recipes[:data]).to be_a(Array)
    expect(recipes[:data]).to eq([])
    expect(recipes[:data].length).to eq(0)
  end
end
