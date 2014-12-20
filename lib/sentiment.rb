require './lib/alchemyapi'
require './lib/parser'
require './lib/db'
require 'bigdecimal'
require 'bigdecimal/util'

class Sentiment

  def initialize
    @word_list = file_to_array 'word_list.txt'
    @feed_list = file_to_array 'feed_list.txt'
    @api = AlchemyAPI.new
    @results = Hash.new { |hash, key| hash[key] = [] }

    @db = DB.new
  end

  def persist
    @results.each do |keyword, sentiments|
      sentiments.each do |sentiment|
        @db.save([keyword, sentiment])
      end
    end
  end

  private
  def file_to_array(file)
    File.readlines(file).map(&:chomp!) rescue []
  end

  def get_score(sentiment)
    score = 0
    if sentiment.key?('score')
      score = sentiment['score']
    end

    score.to_d
  end

end
