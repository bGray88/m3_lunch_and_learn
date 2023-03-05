class YoutubeService
  def self.conn
    Faraday.new(
      url: 'https://www.googleapis.com/youtube/v3/playlistItems',
      params: {
        key:        ENV['YOUTUBE_API_KEY'],
        playlistId: 'UUluQ5yInbeAkkeCndNnUhpw',
        fields:     'items(id,snippet(title,resourceId(videoId)))',
        part:       'snippet',
        maxResults: 50
      },
      headers: {'Content-Type' => 'application/json'}
    )
  end

  def self.list_videos(page_code)
    JSON.parse(conn.get { |req| req.params[:pageToken] = page_code }.body, symbolize_names: true)
  end
end
