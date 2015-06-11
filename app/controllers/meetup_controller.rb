class MeetupController < ApplicationController
  respond_to :json, :xml

  def index
    @groups = current_user.groups
  end

end
