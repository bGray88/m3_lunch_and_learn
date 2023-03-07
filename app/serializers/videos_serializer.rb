class VideosSerializer
  def self.video(video)
    {
      "title":            video.title,
      "youtube_video_id": video.youtube_video_id
    }
  end
end
