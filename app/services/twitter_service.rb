require 'matrix'
require 'tf-idf-similarity'
require 'unicode_utils'

class TwitterService
  attr_reader :client

    def initialize
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['twitter_key']
        config.consumer_secret     = ENV['twitter_secret']
        config.access_token        = ENV['twitter_access_token']
        config.access_token_secret = ENV['twitter_access_token_secret']
      end
    end

    def user_tweets(user)
      client.user_timeline(user, count: 100).map(&:text)
    end

    def word_wizard(tweet)
      document1 = TfIdfSimilarity::Document.new(tweet.join)

      text = document1.term_counts.keys

      stop_words = ["a,able,about,across,after,all,almost,also,am,among,an,and,any,are,as,at,be,because,been,but,by,can,cannot,could,dear,did,do,does,either,else,ever,every,for,from,get,got,had,has,have,he,her,hers,him,his,how,however,i,if,in,into,is,it,its,just,least,let,like,likely,may,me,might,most,must,my,neither,no,nor,not,of,off,often,on,only,or,other,our,own,rather,said,say,says,she,should,since,so,some,than,that,the,their,them,then,there,these,they,this,tis,to,too,twas,us,wants,was,we,were,what,when,where,which,while,who,whom,why,will,with,would,yet,you,your"]
      stop = text - stop_words.split(",")
      # token = UnicodeUtils.each_word(text).to_a - stop_words
      # tokens = UnicodeUtils.each_word(text) - ['and', 'the', 'to']
    end

end
