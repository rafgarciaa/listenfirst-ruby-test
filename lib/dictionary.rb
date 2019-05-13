class Dictionary
  attr_reader :entries

  def initialize
    @entries = Hash.new
  end

  def entries                                 # returns the entries in our dictionary
    @entries
  end

  def add_word(key, val=nil)                  # adds a word to our dictionary
    if val != nil
      @entries.merge!(format(key) => { 'definition' => format(val), 'synonyms' => [] })
    else
      @entries.merge!(format(key) => { 'definition' => nil, 'synonyms' => [] })
    end
  end

  def add_synonym(word1, word2)
    word1_synonyms = @entries[format(word1)]['synonyms']
    word2_synonyms = @entries[format(word2)]['synonyms']

    if !word1_synonyms.include?(format(word2))
      @entries[format(word1)]['synonyms'] << format(word2)
    end

    if !word2_synonyms.include?(format(word1))
      @entries[format(word2)]['synonyms'] << format(word1)
    end
  end

  def look_up_word(word)                      # returns a string of a given `word`s definition
    return @entries[format(word)] ? @entries[format(word)]['definition'] : nil
  end

  def look_up_synonyms(word)                  # returns an array of synonyms of the given `word`
    return @entries[format(word)]['synonyms']
  end

  private
  def format(word)
    return word.to_s.downcase
  end
end

# Sample Dictionary
# entries = {
#   'chilly' => {
#     'definition' => 'uncomfortably cool or cold',
#     'synonyms' => ['cold', 'cool']
#   }
#   'cold' => { 
#     'definition' => 'lacking of affection or warmth',
#     'synonyms' => ['chilly', 'cool']
#   },
#   'cool' => {
#     'definition' => 'of or at fairly low temperature',
#     'synonyms' => ['chilly', 'cold']
#   },
#   'hot' => {
#     'definition' => 'having a high degree of heat or a high temperature',
#     'synonyms' => ['balmy', 'tropical', 'boiling']
#   }
# }