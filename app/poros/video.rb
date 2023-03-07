class Video

  attr_reader :title,
              :youtube_video_id

  def initialize(data)
    @title            = data.dig(:snippet, :title)
    @youtube_video_id = data.dig(:snippet, :resourceId, :videoId)
  end
end
