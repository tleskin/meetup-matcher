class MeetupController < ApplicationController
  respond_to :json, :xml 

  def index
    # call meetup
    meetup = MeetupService.new
    meetup.events(params["lat"], params["lon"])
    
    # respond_with #user lat and lon, user tweets?
  end

  def show
  end
end
