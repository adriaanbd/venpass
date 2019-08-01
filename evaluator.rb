class Evaluator
  attr_accessor :strength

  def initialize
    @strength = nil
  end

  def calculate_strength(words, password)
    password_to_compare = replace_words(words, password)
    char_types(password_to_compare) * (password.size - 1)
  end

  def replace_word(words, password)
    words.each { |word| password.gsub!(word, word[0]) }
  end

  def char_types(password)
    alpha = 0
    digit = 0
    whitespace = 0
    other = 0
    password.each_char do |char|
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