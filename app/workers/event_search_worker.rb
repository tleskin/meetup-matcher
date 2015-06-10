class EventSearchWorker 
  include Sidekiq::Worker 
  sidekiq_options retry: false

  attr_reader :service

  def initialize
    @service = MeetupService.new
  end

  def perform(latitude, longitude, word, user_id)
    events = service.events(latitude, longitude, word)
    events.each do |event| 
      url_name = event[:group][:urlname]
      sleep(5)
      GroupFetcherWorker.perform_async(url_name, user_id)  
    end
  end

end