require './password.rb'

RSpec.describe Password do 
  let(:word) { "ape" }
  let(:two_words) { "ape1key" }
  let(:word_combs) { ["ape", "ap", "a", "pe", "pe", "e"] }
  let(:two_word_combs) { ["ape", "ap", "a", "pe", "pe", "e", "key", "ke", "k", "ey", "ey", "y"] }
  let(:password_1) { Password.new(word) }
  let(:password_2) { Password.new(two_words) }

  describe '#init' do 
    it 'initializes with password' do 
      expect(password_1.text).to eq(word)
    end
  end

  describe '#combinations' do 
    it 'returns all combinations of one word' do 
      expect(password_1.combinations).to eq(word_combs)
    end

    it 'returns all combinations of two words' do 
      expect(password_2.combinations).to eq(two_word_combs)
    end
  end

  describe '#strengthen' do
    it 'replaces letters with corresponding character' do
      password_1.strengthen 
      expect(password_1.updated_text).to eq('@p3')
    end
  end
end