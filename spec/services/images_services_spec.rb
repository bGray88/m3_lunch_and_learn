require 'rails_helper'

RSpec.describe 'Images Service' do
  it 'can return values from API', :vcr do
    images = ImagesService.country_images('thailand')

    expect(images).to be_a(Array)

    image = images.first

    expect(image).to have_key(:width)
    expect(image).to have_key(:height)
    expect(image).to have_key(:alt_description)
    expect(image[:alt_description]).to be_a(String)
    expect(image).to have_key(:urls)
    expect(image[:urls]).to be_a(Hash)
    expect(image[:urls]).to have_key(:regular)
    expect(image.dig(:urls, :regular)).to be_a(String)
  end
end
