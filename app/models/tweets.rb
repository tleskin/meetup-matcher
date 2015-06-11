require 'matrix'
require 'tf-idf-similarity'
require 'unicode_utils'

class Tweets < OpenStruct

  def self.service
    @service ||= TwitterService.new
  end

  def self.tweets(user)
    service.user_tweets(user)
  end

  def self.word_wizard(tweets, current_user)
    tweets = tweets.join.split(",").reject {|word| word.include?("@")}
    document1 = TfIdfSimilarity::Document.new(tweets.join)
    all_words = Hash[document1.term_counts.sort_by{|k, v| v}.reverse].keys
    @tweets = (all_words - stop_words)
    remove_tweets_with_length_less_than_three
  end

  private

  def self.stop_words
    ("a,tco,http,https,i'm,$,githop,=,krista_a_nelson,rt,able,about,across,after,all,almost,also,am,among,an,and,any,are,as,at,be,because,been,but,by,can,cannot,could,dear,did,do,does,either,else,ever,every,for,from,get,got,had,has,have,he,her,hers,him,his,how,however,i,if,in,into,is,it,its,just,least,let,like,likely,may,me,might,most,must,my,neither,no,nor,not,of,off,often,on,only,or,other,our,own,rather,said,say,says,she,should,since,so,some,than,that,the,their,them,then,there,these,they,this,tis,to,too,twas,us,wants,was,we,were,what,when,where,which,while,who,whom,why,will,with,would,yet,you,your").split(",")
  end

  def self.remove_tweets_with_length_less_than_three
    @tweets.reject do |tweet|
      tweet.length < 3
    end.take(5)
  end

end
