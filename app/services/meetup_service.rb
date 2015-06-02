class MeetupService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.meetup.com")
  end

  # https://api.meetup.com/find/groups?key=6f4f7b28527b203a6918482615256c2b&sign=true

  def meetups
    JSON.parse(connection.get("/find/groups?key=#{ENV["meetup_key"]}&sign=true").body, symbolize_names: true)
  end


end
