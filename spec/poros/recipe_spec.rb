require 'rails_helper'

RSpec.describe 'Recipe' do
  it 'exists and has attributes', :vcr do
    recipe = Recipe.new(
      recipe: {
        url: "http://tippel.com/wippletipple/12334",
        label: "Some Place Downtown",
        image: "http://tipples.com/tipple/12334.jpg"
      }
    )

    expect(recipe).to be_a(Recipe)
    expect(recipe.url).to be_a(String)
    expect(recipe.url).to eq("http://tippel.com/wippletipple/12334")
    expect(recipe.title).to be_a(String)
    expect(recipe.title).to eq("Some Place Downtown")
    expect(recipe.image).to be_a(String)
    expect(recipe.image).to eq("http://tipples.com/tipple/12334.jpg")
  end
end
