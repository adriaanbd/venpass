class Evaluator
  attr_reader :strength
  attr_accessor :password

  def initialize(password)
    @password = password
    @strength = nil
  end

  def sequence_of_letters
    @password.scan(/[a-z]+/i)
  end

  def replace_word(words)
    nil if words.empty?
    words.each { |word| @password.gsub!(word, word[0]) }
  end

  def char_types
    alpha = 0
    digit = 0
    whitespace = 0
    other = 0
    @password.each_char do |char|
      if char.match?(/[a-z]/i)
        alpha += 1 if alpha.zero?
      elsif char.match?(/\d/)
        digit += 1 if digit.zero?
      elsif char.match?(/\s/)
        whitespace += 1 if whitespace.zero?
      else
        other += 1 if other.zero?
      end
    end
    alpha + digit + whitespace + other
  end
end