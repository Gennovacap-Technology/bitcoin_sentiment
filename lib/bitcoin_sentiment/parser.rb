class BitcoinSentiment
  class Parser
    def initialize(url)
      @url = url
      @links = []
    end

    def links(cache = true)
      return @links if cache && !@links.empty?
      parse
    end

    private
    def parse
      response = RSS::Parser.parse(@url, false)
      @links = []

      if response.feed_type == "rss"
        response.channel.items.each { |item| @links << item.link }
      elsif response.feed_type == "atom"
        response.entries.each { |entry| @links << entry.link.href }
      end

      @links
    end
  end
end
