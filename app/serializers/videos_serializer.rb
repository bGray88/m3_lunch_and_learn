class VideosSerializer
  def self.video(video)
    {
      "title":            video.dig(:snippet, :title),
      "youtube_video_id": video.dig(:snippet, :resourceId, :videoId)
    }
  end
end
