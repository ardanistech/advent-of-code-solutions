#This can probably be done with a single line of RegEx..
#https://imgflip.com/i/13q59q
class NiceStringsChecker
  def nice_string?(string)
    if string.empty?
      return false
    end

    if has_three_vowels(string) && has_two_consecutive_letters(string) && !has_forbidden_letter_combination(string)
      return true
    end

    return false
  end

  def has_three_vowels(string)
    vowel_count = 0
    'aeiou'.each_char do |c|
        vowel_count = vowel_count + string.count(c)
    end

    return vowel_count >= 3
  end

  def has_two_consecutive_letters(string)
    c = nil
    string.each_char do |cc|
      if(c == cc)
        return true
      end
      c = cc
    end
    return false
  end

  def has_forbidden_letter_combination(string)
    ['ab','cd','pq','xy'].each do |chars|
      if string.include? chars
        return true
      end
    end
    return false
  end
end