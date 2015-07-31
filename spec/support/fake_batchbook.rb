require 'sinatra/base'

class FakeBatchbook < Sinatra::Base

  get '/api/v1/people.json' do
    if check_token(params['auth_token'])
      json_response(200, 'people.json')
    else
      json_response(200, 'error.json')
    end
  end

  get '/api/v1/users.json' do
    if check_token(params['auth_token'])
      json_response(200, 'users.json')
    else
      json_response(200, 'error.json')
    end
  end

  get '/api/v1/custom_field_sets.json' do
     if check_token(params['auth_token'])
      json_response(200, 'custom_field_sets.json')
    else
      json_response(200, 'error.json')
    end
  end

  post '/api/v1/people.json' do
    if check_token(params['auth_token'])
      json_response(201, 'create_person.json')
    else
      json_response(200, 'error.json')
    end
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

  def check_token(token)
    token == '12345abcde'
  end
end
