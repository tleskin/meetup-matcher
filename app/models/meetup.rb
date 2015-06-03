class meetup
  def self.service
    @service ||= MeetupService.new
  end
end
