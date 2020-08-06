require 'pry'

# for every str char move 5 spaces to the right in the alphabet and replace it with that letter
# if we reach the end of the alphabet, go to start of alphabet. E.g. 'z' becomes 'e'.

def caesar_cipher(str, shift_factor)
  # create alphabet array
  alphabet = ('a'..'z').to_a
  # create array that will hold the chars of the new string
  new_str_arr = []
  # create array of current string chars
  str_arr = str.split('')

  # loop over every character of the current string
  for char in str_arr do 
    # downcase char so we can also find it in the alphabet if it's uppercase
    downcase_char = char.downcase;
    # get position of char alphabet
    char_pos = alphabet.index(downcase_char);
    # create var for new char later on
    new_char = ''

    # if the char has been found in the alphabet
    if (char_pos) 
      # if the char_pos + shift_factor index exists in alphabet
      if (alphabet[char_pos + shift_factor])
        new_char = alphabet[char_pos + shift_factor]
      else 
        # we substract how much we could shift at the end of the array from the total shift needed
        # and correct for the shift we already made
        new_char = alphabet[shift_factor - (26 + char_pos)]
      end

    # else if the char is not a letter
    elsif (!char_pos)
      # the new char is the same as the old char (e.g. space, punctuation)
      new_char = char
    end

    # add new char to new string array
    new_str_arr.push(char == downcase_char ? new_char : new_char.upcase)
  end

  # make a string of new string array
  new_str_arr.join
end

p caesar_cipher("What a string!", 5) 
