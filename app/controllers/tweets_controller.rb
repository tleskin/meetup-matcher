class TweetsController < ApplicationController

  def index
    tweets = Tweets.tweets(current_user.nickname)
    @top_20 = Tweets.word_wizard(tweets, current_user)
  end
end
