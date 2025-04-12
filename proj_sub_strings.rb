# frozen_string_literal: true

DICTIONARY << %w[below down go going horn how howdy it i low own part partner sit]

def substrings(text, dict)
  result = {}
  dict.each do |word|
    match = text.downcase.scan(word)
    result.store(word, match.size) if match.size.positive?
  end
  p result
end

substrings('Below', DICTIONARY)
substrings("Howdy partner, sit down! How's it going?", DICTIONARY)
