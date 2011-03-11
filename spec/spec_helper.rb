$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'supermodel'
require 'curb'
require 'threetaps-client'
require 'cgi'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end

def stub_json_decode
  ActiveSupport::JSON.stub!(:decode).and_return []
end

def stub_get_and_json_decode
  Curl::Easy.stub!(:new).and_return mock("Request", :perform => nil, :body_str => "")
  stub_json_decode
end

def stub_post_and_json_decode
  Curl::Easy.stub!(:http_post).and_return mock("Request", :perform => nil, :body_str => "")
  stub_json_decode
end