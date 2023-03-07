require 'rails_helper'

RSpec.describe 'Image' do
  it 'exists and has attributes', :vcr do
    image = Image.new(
      alt_description: "Some Place Downtown",
      urls: {
        regular: "http://wipple.com/tipple/12334"
      }
    )

    expect(image).to be_a(Image)
    expect(image.alt_tag).to be_a(String)
    expect(image.alt_tag).to eq("Some Place Downtown")
    expect(image.url).to be_a(String)
    expect(image.url).to include("http")
  end
end
