require 'rails_helper'

RSpec.describe 'Videos Service' do
  it 'can return values from API', :vcr do
    videos = VideosService.list_videos('EAAaATA')

    expect(videos).to be_a(Hash)
    expect(videos).to have_key(:items)
    expect(videos[:items]).to be_a(Array)

    video = videos[:items].first

    expect(video).to be_a(Hash)
    expect(video).to have_key(:id)
    expect(video[:id]).to be_a(String)
    expect(video).to_not have_key(:type)
    expect(video).to have_key(:snippet)

    video_attributes = video[:snippet]

    expect(video_attributes).to be_a(Hash)
    expect(video_attributes).to have_key(:title)
    expect(video_attributes[:title]).to be_a(String)
    expect(video_attributes).to have_key(:resourceId)
    expect(video_attributes[:resourceId]).to be_a(Hash)
    expect(video_attributes[:resourceId]).to have_key(:videoId)
    expect(video_attributes.dig(:resourceId, :videoId)).to be_a(String)
  end
end
