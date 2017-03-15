class WordCounter

  def count_words(string)
    counts = Hash.new(0)
    string_without_spec_chars = string.gsub(/[.,:;!?*&%$£@€(){}]/, ' ')
    splitted_sorted_words = string_without_spec_chars.downcase.split(" ").sort
    splitted_sorted_words.each do |word|
      counts[word] += 1
    end
    counts
  end

end
