require 'rails_helper'

RSpec.describe 'Learning Resources Facade', :vcr do
  it 'can return a collection of 10 images based on a country name', :vcr do
    images = LearningResourceFacade.find_images('thailand')

    expect(images.length).to eq(10)
    expect(images).to be_a(Array)
    expect(images.first).to be_a(Image)
    expect(images.first.alt_tag).to be_a(String)
    expect(images.first.url).to be_a(String)
  end

  it 'can return a video based on a country name', :vcr do
    video = LearningResourceFacade.find_video('kuwait')

    expect(video).to be_a(Video)
    expect(video.title).to be_a(String)
    expect(video.youtube_video_id).to be_a(String)
  end

  it 'can help me test' do
    WebMock.allow_net_connect!
    VCR.eject_cassette
    VCR.turn_off!

    resource = LearningResourceFacade.combined_resources('')

    expect(resource).to be_a(Array)
    expect(resource.first).to eq({})
    expect(resource.last).to eq([])

    VCR.turn_on!
    WebMock.disable_net_connect!
  end
end
