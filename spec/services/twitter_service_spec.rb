require 'rails_helper'


RSpec.describe TwitterService, type: :model do
  attr_reader :service

  before(:each) do 
    @service = TwitterService.new
  end

  it 'returns a list of tweets' do
    VCR.use_cassette("get_user_tweets") do 
      service = TwitterService.new
      user = User.create(nickname: "mgolle")
      tweets = service.user_tweets(user.nickname)

      expect(tweets).to be_an_instance_of(Array)
    end
  end

end