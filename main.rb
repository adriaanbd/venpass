require './lib/password_evaluator.rb'

puts 'Welcome to TweetSec\'s Password Strength Evaluator'
puts 'Please enter your password:'
user_input = gets.sub(/\n/, '')

password = Password.new(user_input)
dictionary = Dictionary.new('dictionary.json')

possible_words = password.combinations
words = dictionary.matches(possible_words)
words.sort_by! { |word| -word.length }

evaluator = Evaluator.new 

strength = evaluator.calculate_strength(words, password.text)

puts "Your password strength is #{strength}"

if strength == 'Weak'
  password.strengthen
  strength = evaluator.calculate_strength(password.updated_text)
  while evaluator.answer < 50
    password.increase_length
    strength = evaluator.calculate_strength(password.updated_text)
  end
  puts "Your password has been strengthed and is now #{strength}"
  puts "Your new password is: #{password.updated_text}"
end

puts "Please try again with a better password" if evaluator.answer <= 10
