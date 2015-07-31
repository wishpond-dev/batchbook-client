require 'spec_helper'

describe 'External request' do
  it 'tries to hit the batchbook api' do
    uri = 'https://test.batchbook.com'

    response = HTTParty.get(uri)

    expect(response.body).to eq("stubbed response")
  end

end
