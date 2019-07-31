require './evaluator'

RSpec.describe Evaluator do
  let(:word) { "playground" }
  let(:two_words) { "play31ground" }
  let(:evaluator) { Evaluator.new(word) }
  let(:evaluator_2) { Evaluator.new(two_words) }

  describe '#init' do 
    it 'initializes password instance attribute' do 
      expect(evaluator.password).to eq(word)
      expect(evaluator.strength).to eq(0)
    end

    it 'initializes strength instance attribute' do 
      expect(evaluator.strength).to eq(0)
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
end