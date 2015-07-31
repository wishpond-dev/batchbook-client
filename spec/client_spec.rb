require 'spec_helper'

describe Batchbook::Client do
  subject { Batchbook::Client.new }
  let(:user) { 'https://ramon.batchbook.com'}
  let(:token) { '12345abcde'}
  let(:client) { Batchbook::Client.new(user, token)}
  let(:bad_token) { '12345abcd'}
  let(:bad_client) { Batchbook::Client.new(user,bad_token)}

  describe '#initialize' do
    it 'stores the user and token' do
      expect(client.user).to eq(user)
      expect(client.token).to eq(token)
    end
  end

  describe '#ping' do
    context 'good token' do
      it 'returns true' do
        response = client.ping
        expect(response).to be_truthy
      end
    end

    context 'bad_token' do
      it 'returns false' do
        response = bad_client.ping
        expect(response).to be_falsey
      end
    end
  end



  describe '#people' do
    it 'returns the collection of people' do
      response = client.people
      expect(response['page']).to eq(1)
      expect(response['people'].size).to eq(30)
    end

    context 'wrong token' do
      it "returns an error message" do
        response = bad_client.people
        expect(response['error']).to eq('Invalid authentication token.')
      end
    end
  end

  describe '#users' do
    it 'return the collection of users' do
      response = client.users
      expect(response.has_key?('users')).to be_truthy
    end

    context 'wrong token' do
      it "returns an error message" do
        response = bad_client.users
        expect(response['error']).to eq('Invalid authentication token.')
      end
    end
  end

  describe '#custom_field_sets' do
    it 'returns the collection of custom fields' do
      response = client.custom_field_sets
      expect(response.has_key?('custom_field_sets')).to be_truthy
    end

    context 'wrong token' do
      it "returns an error message" do
        response = bad_client.custom_field_sets
        expect(response['error']).to eq('Invalid authentication token.')
      end
    end
  end
end
