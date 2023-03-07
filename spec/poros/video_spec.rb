require 'rails_helper'

RSpec.describe 'Video' do
  it 'exists and has attributes', :vcr do
    video = Video.new(
      snippet: {
        title:            "Some Place Downtown Laos",
        resourceId: {
          videoId: User.random_key
        }
      }
    )

    expect(video).to be_a(Video)
    expect(video.title).to be_a(String)
    expect(video.title).to eq("Some Place Downtown Laos")
    expect(video.youtube_video_id).to be_a(String)
    expect(video.youtube_video_id.length).to eq(32)
  end
end
