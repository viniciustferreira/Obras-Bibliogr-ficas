require 'rails_helper'

RSpec.describe Author::Builder do 
  describe 'create new authors' do
    it 'returns true' do
      bibliography = double(Bibliography, persisted?: true)
      allow(Bibliography).to receive(:create)
        .with(name: 'joao da silva')
        .and_return(bibliography)

      expect(described_class.create('joao da silva')).to eq(true)
    end
  end

  describe 'error when creates' do
    it 'returns false' do
      allow(Bibliography).to receive(:create)
        .with(name: 'joao da silva')
        .and_raise("timeout")

      expect(described_class.create('joao da silva')).to eq(false)
    end
  end
end