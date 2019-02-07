# frozen_string_literal: true

require 'rails_helper'
require 'bcrypt'

RSpec.describe 'Identity', type: :request do
  describe 'create' do
    let(:params) do
      {
        identity: { password: 'P@ssw0rd', first_name: 'Joe', last_name: 'Doe', email: 'joe@foo.com' }
      }
    end
    let!(:winery) { create(:winery) }
    it 'does something' do
      post '/identities', params: params.to_json, headers: json_headers
    end

    it 'does something else' do
      get '/wineries.json', headers: json_headers
      json = JSON.parse(response.body)
      ap json
    end
  end
end
