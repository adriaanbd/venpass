require 'rest-client'
require 'json'

class Dictionary

  @@SOURCES = {:en => "https://raw.githubusercontent.com/dwyl/english-words/master/words_dictionary.json"}

  attr_reader :fname
  attr_accessor :words

  def initialize(fname)
    if File.exist?(fname)
      @words = JSON.load(File.read(fname))
    else 
      create_dictionary(source=@@SOURCES[:en], fname)
    end
  end

  def create_dictionary(source, fname)
    response = RestClient.get(source)
    @words = JSON.parse(response.body.to_s)
    File.write(fname, JSON.dump(@words))
  end

  def matches(words)
    words.filter { |word| exists?(word) }
  end

  private 

  def exists?(word)
    @words[word] == 1
  end
end