# Write a function that given a string returns an array containing
# the most frequent word in it. If the top frequency is shared by more than
# one word, the array will contain all of them (the order is not relevant).
# Your implementation should exclude anything that is not a word
# (e.g. punctuation and numbers)
# If the input is an empty string, return an empty array.
# If the input is not a string, an error should be thrown.
# TIP: You'll need to use a regex.

def most_frequent_words(text)
    unless text.is_a? String
      raise ArgumentError, 'Input must be a string'
    end
  
    return [] if text.empty?
  
    # Extract words containing only letters (exclude numbers and punctuation)
    words = text.scan(/[[:alpha:]]+/).map(&:downcase)
  
    return [] if words.empty?
  
    # Count the frequency of each word
    word_counts = Hash.new(0)
    words.each { |word| word_counts[word] += 1 }
  
    # Find the maximum frequency
    max_frequency = word_counts.values.max
  
    # Select all words that have the maximum frequency
    most_frequent = word_counts.select { |_, count| count == max_frequency }.keys
  
    most_frequent
  end
  

  # Test cases for the most_frequent_words function

def test_most_frequent_words
    # Test with empty string
    puts "Test with empty string:"
    result = most_frequent_words('')
    puts "Expected: []"
    puts "Actual:   #{result.inspect}"
    puts "Pass:     #{result == []}"
    puts "-" * 50
  
    # Test with non-string input
    puts "Test with non-string input:"
    begin
      most_frequent_words(123)
    rescue ArgumentError => e
      puts "Expected: ArgumentError"
      puts "Actual:   #{e.message}"
      puts "Pass:     #{e.message == 'Input must be a string'}"
    end
    puts "-" * 50
  
    # Test with a simple string
    puts "Test with a simple string:"
    input = 'apple banana apple grape banana apple'
    result = most_frequent_words(input)
    puts "Expected: [\"apple\"]"
    puts "Actual:   #{result.inspect}"
    puts "Pass:     #{result == ['apple']}"
    puts "-" * 50
  
    # Test with punctuation and numbers
    puts "Test with punctuation and numbers:"
    input = 'apple! 123 banana, apple? grape; banana: apple.'
    result = most_frequent_words(input)
    puts "Expected: [\"apple\"]"
    puts "Actual:   #{result.inspect}"
    puts "Pass:     #{result == ['apple']}"
    puts "-" * 50
  
    # Test with multiple words sharing max frequency
    puts "Test with multiple words sharing max frequency:"
    input = 'apple banana grape'
    result = most_frequent_words(input)
    expected = ['apple', 'banana', 'grape']
    puts "Expected: #{expected.inspect}"
    puts "Actual:   #{result.inspect}"
    puts "Pass:     #{result.sort == expected.sort}"
    puts "-" * 50
  
    # Test with case insensitivity
    puts "Test with case insensitivity:"
    input = 'Apple apple BANANA banana grape GRAPE grape'
    result = most_frequent_words(input)
    puts "Expected: [\"grape\"]"
    puts "Actual:   #{result.inspect}"
    puts "Pass:     #{result == ['grape']}"
    puts "-" * 50
  
    # Test with all words appearing once
    puts "Test with all words appearing once:"
    input = 'one two three four five'
    result = most_frequent_words(input)
    expected = ['one', 'two', 'three', 'four', 'five']
    puts "Expected: #{expected.inspect}"
    puts "Actual:   #{result.inspect}"
    puts "Pass:     #{result.sort == expected.sort}"
    puts "-" * 50
  
    # Test with words containing non-alpha characters
    puts "Test with words containing non-alpha characters:"
    input = 'hello-world hello_world hello world!'
    result = most_frequent_words(input)
    expected = ['hello', 'world']
    puts "Expected: #{expected.inspect}"
    puts "Actual:   #{result.inspect}"
    puts "Pass:     #{result.sort == expected.sort}"
    puts "-" * 50
  
    # Test with only punctuation and numbers
    puts "Test with only punctuation and numbers:"
    input = '1234, 5678! @#$%'
    result = most_frequent_words(input)
    puts "Expected: []"
    puts "Actual:   #{result.inspect}"
    puts "Pass:     #{result == []}"
    puts "-" * 50
  end
  
  # Run the test function
  test_most_frequent_words
  