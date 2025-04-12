# frozen_string_literal: true

LETTERS = ('a'..'z').each_with_index.to_h
INDICES = LETTERS.invert

def get_letter(letter, shift)
  n_i = LETTERS[letter] + shift
  n_i -= LETTERS.size if n_i >= LETTERS.size
  INDICES[n_i]
end

def ceasar_cipher(text, shift = 1)
  n_t = ''
  text.each_char do |l|
    n_t += get_letter(l, shift)
  end
  n_t
end

text = gets.chomp
cc = ceasar_cipher text
p cc.to_s
