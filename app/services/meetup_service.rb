class MeetupService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.meetup.com")
  end

  def events(latitude, longitude, top_tweets)
    @responses = top_tweets.flat_map do |word|
      parse(connection.get("/2/open_events?key=#{ENV["meetup_key"]}&sign=true&photo-host=public&lat=#{latitude}&text=#{word}&lon=#{longitude}").body)
    end
  end

  def event_results
    @responses.flat_map {|response| response[:results] }
  end

  def groups
    event_results.map { |result| result[:group] }
  rescue NoMethodError
    byebug
  end

  def all_groups
    groups[0..0].flat_map do |group|
      parse(connection.get("/2/groups?key=#{ENV["meetup_key"]}&sign=true&photo-host=public&group_urlname=#{group[:urlname]}").body)
    end
  end

  def group_results
    all_groups.map { |group| group[:results] }
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end
