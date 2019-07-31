class Evaluator
  attr_reader :strength
  attr_accessor :password

  def initialize(password)
    @password = password
    @strength = 0
  end

  def sequence_of_letters
    @password.scan(/[a-z]+/i)
  end
end