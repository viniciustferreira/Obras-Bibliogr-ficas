require 'rails_helper'

RSpec.describe Author::Translator do 
  describe 'create translate the author names into the pattern' do
    it 'returns SILVA, Joao' do
      expect(described_class.translate('joao silva')).to eq('SILVA, Joao')
    end

    it 'returns NETO, Charles' do
      expect(described_class.translate('charles neto')).to eq('NETO, Charles')
    end

    it 'returns SILVA NETA, Maria' do
      expect(described_class.translate('maria silva neta')).to eq('SILVA NETA, Maria')
    end

    it 'returns SOUZA, Claudia de' do
      expect(described_class.translate('claudia de souza')).to eq('SOUZA, Claudia de')
    end
  end
end