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
    'i' => '!',
    's' => '$',
    'l' => '1',
    'e' => '3',
    'r' => '2',
    'g' => '9'
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

  def increase_length
    if @updated_text.match? /\s/
      @updated_text << "!"
    else
      @updated_text << ' '
    end
  end

  private

  def letter_sequence
    @text.scan(/[a-z]+/i)
  end
end