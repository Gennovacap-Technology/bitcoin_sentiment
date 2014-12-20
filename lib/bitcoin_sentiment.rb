require 'json'
require 'net/http'
require 'uri'
require 'rss'
require 'open-uri'
require 'bigdecimal'
require 'bigdecimal/util'

require 'bitcoin_sentiment/version'
require 'bitcoin_sentiment/alchemyapi'
require 'bitcoin_sentiment/parser'
require 'bitcoin_sentiment/sentiment'
require 'bitcoin_sentiment/keyword'
require 'bitcoin_sentiment/targeted'


class BitcoinSentiment
  TYPES = [:keyword, :targeted]

  def self.build(type: :keyword, keywords:, feeds:, api_key:)
    raise(ArgumentError, "Invalid Option") unless TYPES.include?(type)
    Kernel.const_get("BitcoinSentiment::#{type.to_s.capitalize}").new(keywords, feeds, api_key)
  end
end
