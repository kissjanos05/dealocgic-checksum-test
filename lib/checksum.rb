class Checksum

  class << self

    def create_checksum input
      result = upcase_vowels capitalize_words create_words filter_string(input)

      [input.split(' ').size,
       result.split(' ').size,
       result.scan(/[AEIOU]/).size,
       result.scan(/[^aeiou ]/i).size,
       input.size].join('-')
    end

    def filter_string input
      input.delete('^A-Za-z ')
    end

    def create_words input
      input.delete(' ').scan(/.{1,10}/).join(' ')
    end

    def capitalize_words input
      input.split(' ').map(&:capitalize).join(' ')
    end

    def upcase_vowels input
      last_vowel_is_uppercase = nil
      consonants_count        = 0
      first_char              = true
      input.split('').inject('') do |new_word, char|
        last_vowel_is_uppercase = true if char.match(/[AEIOU]/)
        last_vowel_is_uppercase, consonants_count = [false, 0] if char.match(/[aeiou]/) and consonants_count < 2
        consonants_count += 1 if char.match(/[^aeiou]/i)
        if last_vowel_is_uppercase and consonants_count >= 2 and char.match(/[aeiou]/)
          consonants_count = 0
          new_word += char.upcase
        else
          new_word += !first_char && char.match(/[aeiou]/i) ? char.downcase : char
        end
        first_char = char == ' '
        new_word
      end
    end

  end

end

