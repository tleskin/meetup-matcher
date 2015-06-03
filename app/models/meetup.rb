class Meetup
  def self.service
    @service ||= MeetupService.new
  end
end
