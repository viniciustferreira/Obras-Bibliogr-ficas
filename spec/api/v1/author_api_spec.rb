require 'rails_helper'

RSpec.describe API::Author, type: :api do
  describe 'insert new authors names' do
    context 'POST /api/v1/authors/new?name=fabio de almeida'  do
      it 'returns 201' do
        expect(call_api.status).to eq(201)
      end
    end
  end

  describe 'trying to create authors names and fail' do
    context 'POST /api/v1/authors/new?name=maria celia neta'  do
      it 'returns 500' do
        expect(call_api.status).to eq(500)
      end
    end
  end

  describe 'get a list of X authors names' do
    context 'GET /api/v1/authors/list?number_of_elements=3' do
      it 'returns 200 and a list with 3 elements' do
        response_call_api = call_status
        expect(response_call_api.body).to eq(['SILVA, Joao','SILVA NETA, Claudia','FERNANDES, Joaquim de'])
        expect(response_call_api.status).to eq(200)
      end
    end
  end

  describe 'trying to get a list without having data' do
    context 'GET /api/v1/authors/list?number_of_elements=9' do
      it 'returns 200 and a empty list' do
        response_call_api = call_status
        expect(response_call_api.body).to eq([])
        expect(response_call_api.status).to eq(200)
      end
    end
  end

  describe 'trying to get a list and have a internal error' do
    context 'GET /api/v1/authors/list?number_of_elements=9' do
      it 'returns 500' do
        expect(call_api.status).to eq(500)
      end
    end
  end
end