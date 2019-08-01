require 'byebug'

class Password
  attr_reader :text, :icebox
  attr_accessor :updated_text

  def initialize(text)
    @text = text 
    @updated_text = ''
    @icebox = {
    'a' => '@',
    'o' => '0',
    'b' => '3',
    'i' => '1',
    's' => '$',
    'l' => '1',
    'e' => '3',
    'r' => '2'
    } 
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

  def strengthen
    @text.split('').each do |char|
      replacement =  @icebox[char]
      replacement.nil? ? @updated_text << char : @updated_text << replacement
    end
  end

  private

  def letter_sequence
    @text.scan(/[a-z]+/i)
  end
end