class BitcoinSentiment
  class AlchemyAPI

    BASE_URL = 'http://access.alchemyapi.com/calls'
    KEYWORDS_ENDPOINT = BASE_URL + '/url/URLGetRankedKeywords'
    TARGETED_ENDPOINT = BASE_URL + '/url/URLGetTargetedSentiment'

    def initialize(api_key)
      @api_key = api_key
    end

    def keywords(url, options = {})
      options = {
        'keywordExtractMode' => 'normal',
        'sentiment' => 1,
        'showSourceText' => 0,
        'maxRetrieve' => 100
      }.merge(options)

      options['url'] = url
      analyze(KEYWORDS_ENDPOINT, options)
    end

    def targeted(url, keyword, options = {})
      options = {'showSourceText' => 0}.merge(options)

      options['url'] = url
      options['target'] = keyword
      analyze(TARGETED_ENDPOINT, options)
    end

    private
    def analyze(url, options)
      options['apikey'] = @api_key
      options['outputMode'] = 'json'

      uri = URI.parse(url)
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(options)
      request['Accept-Encoding'] = 'identity'

      res = Net::HTTP.start(uri.host, uri.port) do |http|
        http.request(request)
      end

      JSON.parse(res.body)
    end

  end
end
