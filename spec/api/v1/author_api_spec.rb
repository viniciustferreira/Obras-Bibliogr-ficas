require 'rails_helper'

RSpec.describe V1::AuthorAPI, type: :api do
  describe 'insert new authors names' do
    context 'POST /v1/author/new?name=fabio%20de%20almeida'  do
      it 'returns 201' do
        call_api
        expect(response.status).to eq(201)
      end
    end
  end

  describe 'trying to create authors names and fail' do
    context 'POST /v1/author/new?name=maria%20celia%20neta'  do
      it 'returns 500' do
        allow(Author::Builder).to receive(:create)
          .with("maria celia neta")
          .and_raise("timeout")

        call_api
        expect(response.status).to eq(500)
      end
    end
  end

  describe 'get a list of X authors names' do
    context 'GET /v1/author/list?number_of_elements=3' do
      it 'returns 200 and a list with 3 elements' do
        Bibliography.create([{ name: "joao silva"},{ name: 'claudia silva neta'},{ name: 'joaquim de fernandes' }])
        call_api
        expect(response.body).to eq("[\"SILVA, Joao\", \"SILVA NETA, Claudia\", \"FERNANDES, Joaquim de\"]")
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'trying to get a list without having data' do
    context 'GET /v1/author/list?number_of_elements=9' do
      it 'returns 200 and a empty list' do
        call_api
        expect(response.body).to eq([].to_json)
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'trying to get a list and have a internal error' do
    context 'GET /v1/author/list?number_of_elements=9' do
      it 'returns 500' do
        Bibliography.create( name: "joao silva")
        allow(Author::Translator).to receive(:translate)
          .with("joao silva")
          .and_raise("timeout")

        call_api
        expect(response.status).to eq(500)
      end
    end
  end
end