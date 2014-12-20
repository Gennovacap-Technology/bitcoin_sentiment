class Keyword < Sentiment

  def fetch
    @feed_list.each do |feed|
      Parser.new(feed).links.each do |link|
        response = @api.keywords('url', link, { 'sentiment'=>1, 'maxRetrieve' => 100 })
        parse_response(response)
      end
    end

    @results
  end

  private
  def parse_response(response)
    if response['status'] == 'OK'
      analyze_keywords(response['keywords'])
    end
  end

  def analyze_keywords(keywords)
    keywords.each do |k|
      keyword = normalize_keyword(k['text'])
      sentiment = k['sentiment']

      if @word_list.include?(keyword)
        @results[keyword] << get_score(sentiment)
      end
    end
  end

  def normalize_keyword(keyword)
    keyword.downcase
  end

end
