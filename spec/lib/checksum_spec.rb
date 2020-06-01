require 'spec_helper'


describe Checksum do

  context '.create_checksum' do

    it 'creates checksum' do
      input = "foo bar baz wibble fizzbuzz fizz buzz"
      expect(Checksum.create_checksum(input)).to eq "7-4-5-21-37"
    end

  end

  context '.filter_string' do

    it 'removes non-english characters except space' do
      input = '1a2á 3bc+%'
      expect(Checksum.filter_string(input)).to eq "a bc"
    end

    it 'does not remove english characters and spaces' do
      input = "foo bar baz wibble fizzbuzz fizz buzz"
      expect(Checksum.filter_string(input)).to eq input
    end

  end

  context '.create_words' do

    it 'creates 10 characters long words from input' do
      input = "foo bar baz wibble fizzbuzz fizz buzz"
      expect(Checksum.create_words(input)).to eq "foobarbazw ibblefizzb uzzfizzbuz z"
    end

  end

  context '.capitalize_words' do
    
    it 'capitalizes each words' do
      input = "foobarbazw ibblefizzb uzzfizzbuz z"
      expect(Checksum.capitalize_words(input)).to eq "Foobarbazw Ibblefizzb Uzzfizzbuz Z"
    end

  end

  context '.upcase_vowels' do

    it 'upcases any vowels that match the rules' do
      input = "Foobarbazw Ibblefizzb Uzzfizzbuz Z"
      expect(Checksum.upcase_vowels(input)).to eq "Foobarbazw IbblEfizzb UzzfIzzbUz Z"
    end

    it 'downcases any vowles that does not match the rules except first letter of the word' do
      input = "abcdEfg"
      expect(Checksum.upcase_vowels(input)).to eq "abcdefg"
    end

  end

end
