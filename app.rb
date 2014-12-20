require './lib/sentiment_factory'

s = SentimentFactory::build(:keyword)
s.fetch
s.persist
