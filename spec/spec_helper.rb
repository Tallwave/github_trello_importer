require 'rspec'
require 'webmock/rspec'
require_relative '../lib/importer'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
end
