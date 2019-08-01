class Password
  attr_reader :text
  attr_accessor :updated_text

  def initialize(text)
    @text = text 
    @updated_text = nil 
  end

  def combinations(words=nil)
    words = letter_sequence if words.nil?
    combs = []
    words.each do |word|
      0.upto(word.size - 1) do |i|
        word.size.downto(i + 1) do |j|
          combs << word[i, j]
        end
      end
    end
    combs
  end

  private

  def letter_sequence
    @text.scan(/[a-z]+/i)
  end
end