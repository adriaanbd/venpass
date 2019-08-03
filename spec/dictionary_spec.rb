require 'spec_helper'

RSpec.describe Dictionary do
  let(:word) { "playground" }
  let(:not_word) { "asdf" }
  let(:dictionary) { Dictionary.new('dictionary.json') }
  let(:array_words) { ["apple", "orange", "asdf"] }

  describe '#matches' do 
    it 'returns array of word matches' do 
      expect(dictionary.matches(array_words)).to eq([array_words[0], array_words[1]])
    end
  end
end