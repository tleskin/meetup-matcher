class MeetupService

  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.meetup.com")
  end

  def events(latitude, longitude, word)
    response = connection.get("/2/open_events?key=#{ENV["meetup_key"]}&sign=true&photo-host=public&lat=#{latitude}&text=#{word}&lon=#{longitude}&page=10")
    response_body = parse(response.body)

    if response.status_code == 200
      response_body[:results]
    elsif response.status_code == 429
      max_number_of_requests = response.header["X-RateLimit-Limit"]
      requests_remaining = response.header["X-RateLimit-Remaining"]
      seconds_until_reset = response.header["X-RateLimit-Reset"]
      message = [
        "Rate limit exceeded.",
        "Max # of requests: #{max_number_of_requests}",
        "# of requests remaining: #{requests_remaining}",
        "# of seconds until reset: #{seconds_until_reset}"
      ].join("\n")
      raise(message)
    else
      raise "Failed to fetch events: #{response_body}"
    end
  end

  def group(url_name)
    response = connection.get("/2/groups?key=#{ENV["meetup_key"]}&sign=true&photo-host=public&group_urlname=#{url_name}")
    response_body = parse(response.body)

    if response.status_code == 200
      response_body[:results].first
    else
      raise "Failed to fetch events: #{response_body}"
    end
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end
