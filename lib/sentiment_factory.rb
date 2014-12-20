require './lib/sentiment'
require './lib/keyword'
require './lib/targeted'

class SentimentFactory
  TYPES = [:keyword, :targeted]

  def self.build(type = :keyword)
    raise("Invalid Option") unless TYPES.include?(type)
    Kernel.const_get(type.to_s.capitalize).new
  end
end
