class MeetupService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.meetup.com")
  end

  def events(latitude, longitude, top_tweets)
    @events = top_tweets.map do |tweet|
      parse(connection.get("/2/open_events?key=#{ENV["meetup_key"]}&sign=true&photo-host=public&lat=#{latitude}&text=#{tweet}&lon=#{longitude}").body)
    end
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end
