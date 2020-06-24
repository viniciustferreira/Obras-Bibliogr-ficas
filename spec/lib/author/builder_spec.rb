require 'rails_helper'

RSpec.describe Author::Builder do 
  describe 'create new authors' do
    it 'returns true' do
      expect(described_class.create('joao da silva','maria moura')).to eq(true)
    end
  end

  describe 'error when creates' do
    it 'returns false' do
      expect(described_class.create('joao da silva')).to eq(false)
    end
  end
end