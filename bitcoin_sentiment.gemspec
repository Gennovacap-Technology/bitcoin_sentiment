lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitcoin_sentiment/version'

Gem::Specification.new do |spec|
  spec.name = 'bitcoin_sentiment'
  spec.version = BitcoinSentiment::VERSION
  spec.authors = ['Bruno Santos']
  spec.email = ['brunoasantos2@gmail.com']
  spec.description = 'Gem to analyze bitcoin sentiment by keyword'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/Gennovacap-Technology/bticoin_sentiment'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'json'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
