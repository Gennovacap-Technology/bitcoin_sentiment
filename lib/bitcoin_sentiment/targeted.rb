class BitcoinSentiment
  class Targeted < Sentiment
    def fetch
      @feed_list.each do |feed|
        Parser.new(feed).links.each do |link|
          analyze_keywords(link)
        end
      end

      @results
    end

    private
    def analyze_keywords(link)
      @word_list.each do |keyword|
        response = @api.sentiment_targeted('url', link, keyword)
        parse_response(response, keyword)
      end
    end

    def parse_response(response, keyword)
      if response['status'] == 'OK'
        @results[keyword] << get_score(response['docSentiment'])
      end
    end
  end
end
