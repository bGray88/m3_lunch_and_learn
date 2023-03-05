require 'rails_helper'

RSpec.describe 'Learning Resources Facade', :vcr do
  it 'can return a collection of 10 images based on a country name', :vcr do
    images = LearningResourceFacade.find_images('thailand')

    expect(images.length).to eq(10)
    expect(images).to be_a(Array)
    expect(images[0]).to have_key(:id)
    expect(images[0]).to be_a(Hash)
    expect(images.dig(0, :id)).to be_a(String)
    expect(images[0]).to have_key(:urls)
    expect(images.dig(0, :urls)).to be_a(Hash)
    expect(images.dig(0, :urls)).to have_key(:regular)
    expect(images.dig(0, :urls, :regular)).to be_a(String)
  end

  it 'can return a video based on a country name', :vcr do
    video = LearningResourceFacade.find_video('kuwait')

    expect(video).to be_a(Hash)
    expect(video).to have_key(:id)
    expect(video[:id]).to be_a(String)
    expect(video).to have_key(:snippet)
    expect(video[:snippet]).to be_a(Hash)
    expect(video[:snippet]).to have_key(:title)
    expect(video.dig(:snippet, :title)).to be_a(String)
    expect(video[:snippet]).to have_key(:resourceId)
    expect(video.dig(:snippet, :resourceId)).to be_a(Hash)
  end
end
