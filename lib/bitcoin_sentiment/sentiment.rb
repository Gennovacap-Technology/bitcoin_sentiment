class BitcoinSentiment
  class Sentiment
    def initialize(keywords, feeds, api_key)
      @word_list = keywords
      @feed_list = feeds
      @api = AlchemyAPI.new(api_key)
      @results = Hash.new { |hash, key| hash[key] = [] }
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
end
