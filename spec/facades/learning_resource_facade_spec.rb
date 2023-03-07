require 'rails_helper'

RSpec.describe 'Learning Resource Facade' do
  it 'can return a collection of 10 images based on a country name', :vcr do
    images = LearningResourceFacade.find_images('thailand')

    expect(images.length).to eq(10)
    expect(images).to be_a(Array)
    expect(images.first).to be_a(Image)
    expect(images.first.alt_tag).to be_a(String)
    expect(images.first.url).to be_a(String)
  end

  it 'can return a video based on a country name', vcr: {record: :new_episodes} do
    video = LearningResourceFacade.find_video('kuwait')

    expect(video).to be_a(Video)
    expect(video.title).to be_a(String)
    expect(video.youtube_video_id).to be_a(String)
  end

  it 'can return resources with combined video and image attributes', vcr: {record: :new_episodes} do
    resource = LearningResourceFacade.combined_resources('laos')

    expect(resource).to be_a(Hash)
    expect(resource[:video]).to be_a(Hash)
    expect(resource[:video]).to have_key(:title)
    expect(resource.dig(:video, :title)).to be_a(String)
    expect(resource[:video]).to have_key(:youtube_video_id)
    expect(resource.dig(:video, :youtube_video_id)).to be_a(String)
    expect(resource[:images]).to be_a(Array)
    expect(resource[:images].first).to have_key(:alt_tag)
    expect(resource.dig(:images, 0, :alt_tag)).to be_a(String)
    expect(resource[:images].first).to have_key(:url)
    expect(resource.dig(:images, 0, :url)).to be_a(String)
    expect(resource.dig(:images, 0, :url)).to include("http")
  end
  
  it 'can return empty json if empty string passed', :vcr do
    resource = LearningResourceFacade.combined_resources('')

    expect(resource).to be_a(Hash)
    expect(resource[:video]).to eq({})
    expect(resource[:images]).to eq([])
    expect(resource[:video]).to_not have_key(:title)
    expect(resource[:video]).to_not have_key(:youtube_video_id)
    expect(resource[:images]).to be_a(Array)
    expect(resource[:images].length).to eq(0)
  end

  it 'can return empty json if empty value passed', :vcr do
    resource = LearningResourceFacade.combined_resources(nil)

    expect(resource).to be_a(Hash)
    expect(resource[:video]).to eq({})
    expect(resource[:images]).to eq([])
    expect(resource[:video]).to_not have_key(:title)
    expect(resource[:video]).to_not have_key(:youtube_video_id)
    expect(resource[:images]).to be_a(Array)
    expect(resource[:images].length).to eq(0)
  end

  it 'can process all pages for video service and return single record', vcr: {record: :new_episodes} do
    resource = LearningResourceFacade.process_video_pages('gambia')

    expect(resource).to be_a(Hash)
    expect(resource).to have_key(:id)
    expect(resource).to have_key(:snippet)
    expect(resource[:snippet]).to have_key(:resourceId)
    expect(resource[:snippet]).to have_key(:title)
    expect(resource.dig(:snippet, :resourceId)).to have_key(:videoId)
  end
end
