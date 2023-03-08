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
    resources = LearningResourceFacade.combined_resources('laos')

    expect(resources).to have_key(:data)

    resource = resources[:data]

    expect(resource).to be_a(Hash)
    expect(resource).to have_key(:id)
    expect(resource[:id]).to eq(nil)
    expect(resource).to have_key(:type)
    expect(resource[:type]).to eq('learning_resource')
    expect(resource).to have_key(:attributes)
    expect(resource[:attributes]).to be_a(Hash)
    expect(resource[:attributes]).to have_key(:video)
    expect(resource.dig(:attributes, :video)).to be_a(Hash)
    expect(resource[:attributes]).to have_key(:images)
    expect(resource.dig(:attributes, :images)).to be_a(Array)

    resource_video = resource.dig(:attributes, :video)
    resource_images = resource.dig(:attributes, :images)

    expect(resource_video).to be_a(Hash)
    expect(resource_video).to have_key(:title)
    expect(resource_video[:title]).to be_a(String)
    expect(resource_video).to have_key(:youtube_video_id)
    expect(resource_video[:youtube_video_id]).to be_a(String)
    expect(resource_images).to be_a(Array)
    expect(resource_images.first).to be_a(Hash)
    expect(resource_images.first).to have_key(:alt_tag)
    expect(resource_images.first[:alt_tag]).to be_a(String)
    expect(resource_images.first).to have_key(:url)
    expect(resource_images.first[:url]).to be_a(String)
    expect(resource_images.first[:url]).to include("http")
  end

  it 'can return error json if invalid country name passed in', :vcr do
    expect{
      LearningResourceFacade.combined_resources("lhsldfiuahlsid")
    }.to raise_error(SearchError) { |error| expect(error.details).to eq("invalid country") }
  end

  it 'can return empty json if empty string passed', :vcr do
    resources = LearningResourceFacade.combined_resources("")

    expect(resources).to have_key(:data)

    resource = resources[:data]

    expect(resource).to be_a(Hash)
    expect(resource.dig(:attributes, :video)).to eq({})
    expect(resource.dig(:attributes, :images)).to eq([])
    expect(resource.dig(:attributes, :video)).to_not have_key(:title)
    expect(resource.dig(:attributes, :video)).to_not have_key(:youtube_video_id)
    expect(resource.dig(:attributes, :images)).to be_a(Array)
    expect(resource.dig(:attributes, :images).length).to eq(0)
  end

  it 'can return empty json if empty value passed', :vcr do
    resources = LearningResourceFacade.combined_resources(nil)

    expect(resources).to have_key(:data)

    resource = resources[:data]

    expect(resource).to be_a(Hash)
    expect(resource.dig(:attributes, :video)).to eq({})
    expect(resource.dig(:attributes, :images)).to eq([])
    expect(resource.dig(:attributes, :video)).to_not have_key(:title)
    expect(resource.dig(:attributes, :video)).to_not have_key(:youtube_video_id)
    expect(resource.dig(:attributes, :images)).to be_a(Array)
    expect(resource.dig(:attributes, :images).length).to eq(0)
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
