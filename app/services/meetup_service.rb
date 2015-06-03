class MeetupService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.meetup.com")
  end

  def meetups
    parse(connection.get("/find/groups?key=#{ENV["meetup_key"]}&sign=true").body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end
