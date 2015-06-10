class GroupFetcherWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  attr_reader :service

  def initialize
    @service = MeetupService.new
  end

  def perform(url_name, user_id)
    group = service.group(url_name)
    name = group[:name]
    if group[:group_photo]
      photo_url = group[:group_photo][:photo_link]
    else
      photo_url = nil
    end
    unless Group.exists?(url_name: url_name)
      Group.create!({name: name, photo_url: photo_url, url_name: url_name, user_id: user_id})
    end
  end

end