class TweetWordExtractorWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user_id, latitude, longitude)
    user = User.find(user_id)
    tweets = Tweets.tweets(user.nickname)
    top_5 = Tweets.word_wizard(tweets, user)
    top_5.each do |word| 
      sleep(5)
      EventSearchWorker.perform_async(latitude, longitude, word, user_id)
    end
  end

end