require 'batchbook/client'
require 'webmock/rspec'
require 'support/fake_batchbook'
require 'pry'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'https://test.batchbook.com').
      with(headers: {'Accept' => '*/*', 'User-Agent' => 'Ruby'}).
      to_return(status: 200, body: "stubbed response", headers: {})

    stub_request(:any, /https:\/\/ramon.batchbook.com/).to_rack(FakeBatchbook)
  end
end
