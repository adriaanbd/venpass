require './evaluator'

RSpec.describe Evaluator do
  let(:word) { "playground" }
  let(:two_words) { "play31ground" }
  let(:three_types) { "test 31" }
  let(:four_types) { "test 31*" }
  let(:evaluator) { Evaluator.new(word) }
  let(:evaluator_2) { Evaluator.new(two_words) }

  describe '#init' do 
    it 'initializes password instance attribute' do 
      expect(evaluator.password).to eq(word)
    end

    it 'initializes strength instance attribute' do 
      expect(evaluator.strength).to eq(nil)
    end

  end

  describe '#sequence_of_letters' do 
    it 'extracts sequence of letters' do 
      expect(evaluator.sequence_of_letters).to eq([word])
    end

    it 'identifies two sequences of letters' do 
      expect(evaluator_2.sequence_of_letters).to eq(['play', 'ground'])
    end
  end

  describe '#replace_word' do 
    it 'replaces two words each with one character' do 
      words = evaluator_2.sequence_of_letters
      evaluator_2.replace_word(words)
      expect(evaluator_2.password).to eq('p31g')
    end
  end

  describe '#character_types' do 
    it 'identifies one character type' do 
      expect(evaluator.char_types).to eq(1)
    end

    it 'identifies two character types' do 
      expect(evaluator_2.char_types).to eq(2)
    end

    it 'identifies three character types' do 
      expect(Evaluator.new(three_types).char_types).to eq(3)
    end

    it 'identifies four character types' do 
      expect(Evaluator.new(four_types).char_types).to eq(4)
    end
  end
end