require './evaluator'

RSpec.describe Evaluator do
  let(:word) { "playground" }
  let(:two_words) { "play31ground" }
  let(:three_types) { "test 31" }
  let(:four_types) { "test 31*" }
  let(:evaluator) { Evaluator.new }
  let(:password) { "password" }
  let(:words) { ['password', 'sword', 'word', 'fun'] }

  describe '#init' do 
    it 'initializes answer instance attribute' do 
      expect(evaluator.answer).to eq(nil)
    end
  end

  describe '#character_types' do 
    it 'identifies one character type' do 
      expect(evaluator.char_types(word)).to eq(1)
    end

    it 'identifies two character types' do 
      expect(evaluator.char_types(two_words)).to eq(2)
    end

    it 'identifies three character types' do 
      expect(evaluator.char_types(three_types)).to eq(3)
    end

    it 'identifies four character types' do 
      expect(evaluator.char_types(four_types)).to eq(4)
    end
  end

  describe '#calculate_strength' do 
    it 'returns correct strength for 2 char types' do 
      pw = password + "1"
      evaluator.calculate_strength([password], pw)
      expect(evaluator.answer).to eq(4)
    end

    it 'returns strength for 2 char types: two words one number' do 
      pw = 'pass31word'
      words = pw.split(/\d+/)
      evaluator.calculate_strength(words, pw)
      expect(evaluator.answer).to eq(8)
    end

    it 'returns strength when three words in one: passwordfun' do
      pw = password + 'fun'
      evaluator.calculate_strength(words, pw) 
      expect(evaluator.answer).to eq(2)
    end

    it 'returns strength when three char types' do
      pw = 'goat m4n'
      evaluator.calculate_strength(['goat'], pw) 
      expect(evaluator.answer).to eq(15)
    end

    it 'returns strength when three char types' do
      pw = 'goat m4n'
      evaluator.calculate_strength(['goat'], pw) 
      expect(evaluator.answer).to eq(15)
    end

    it 'returns strength when four char types' do
      pw = 's0_0per 5nak3'
      evaluator.calculate_strength(['per', 'nak'], pw) 
      expect(evaluator.answer).to eq(36)
    end
  end
end