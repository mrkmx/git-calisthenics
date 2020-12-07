alphabet = ('a'..'z').to_a
vowels = %w[a e i o u]
vowels_hash = {}

vowels.each do |letter|
  if alphabet.include? letter
    vowels_hash[letter] = alphabet.index(letter) + 1
  end
end

puts vowels_hash
