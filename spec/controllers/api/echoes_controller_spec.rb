require 'rails_helper'

RSpec.describe Api::EchoesController, type: :request do
  let(:headers) { { 'ACCEPT' => 'application/json' } }

  describe '#index' do
    it 'responds with same string it gets' do
      get api_echoes_path, params: { say: 'hello' }, headers: headers
      expect(parsed_body).to eq({ 'say' => 'hello' })
    end

    it 'responds with something if it gets nothing' do
      get api_echoes_path, headers: headers
      expect(parsed_body).to eq({ 'say' => 'something' })
    end
  end
end
