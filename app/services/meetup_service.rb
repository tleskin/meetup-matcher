class MeetupService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.meetup.com")
  end

  def meetups
    parse(connection.get("/find/groups?key=#{ENV["meetup_key"]}&sign=true").body)
  end

  def events(latitude, longitude)
    parse(connection.get("/2/open_events?key=#{ENV["meetup_key"]}&sign=true&photo-host=public&lat=#{latitude}&text=ruby&lon=#{longitude}").body)
    byebug
  end


  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end
