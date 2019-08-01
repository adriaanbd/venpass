require './evaluator'

RSpec.describe Evaluator do
  let(:word) { "playground" }
  let(:two_words) { "play31ground" }
  let(:three_types) { "test 31" }
  let(:four_types) { "test 31*" }
  let(:evaluator) { Evaluator.new }

  describe '#init' do 
    it 'initializes strength instance attribute' do 
      expect(evaluator.strength).to eq(nil)
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
end