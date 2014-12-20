require './lib/sentiment_factory'

s = SentimentFactory::build(:keyword)
s.fetch
s.persist


keywords = File.readlines('word_list.txt').map(&:chomp!) ; feeds = File.readlines('feed_list.txt').map(&:chomp!) ; nil
s = BitcoinSentiment.build(keywords: keywords, feeds: feeds, api_key: 'e74548c4f638124f285c9f5499c228dbcc231c57')
