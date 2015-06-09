class MeetupController < ApplicationController
  respond_to :json, :xml 

  def index
    tweets = Tweets.tweets(current_user.nickname)
    top_30 = Tweets.word_wizard(tweets, current_user)
    meetup = MeetupService.new
    meetup.events(session[:lat], session[:lon], top_30)
  end

  def show
  end
end
