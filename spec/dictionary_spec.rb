require 'rspec'
require 'dictionary'

describe Dictionary do
  let(:new_dict) { Dictionary.new }
  
  describe "#initialize" do
    it "sets up new instance of dictionary" do
      expect(new_dict).to be_an_instance_of(Dictionary)
    end
  end

  describe "#add_word" do
    it "adds a word to the dictionary" do
      new_dict.add_word('chilly', 'uncomfortably cool or cold')
      expect(new_dict.entries['chilly']).to be_truthy
    end

    it "adds a word with the correct definition to the dictionary" do
      new_dict.add_word('chilly', 'uncomfortably cool or cold')
      expect(new_dict.entries['chilly']['definition']).to eq('uncomfortably cool or cold')
    end
  end

  describe "#add_synonym" do
    it "adds a synonym to the synonyms array" do
      new_dict.add_word('chilly', 'uncomfortably cool or cold')
      new_dict.add_word('cold', 'lacking of affection or warmth')
      new_dict.add_synonym('chilly', 'cold')
      expect(new_dict.entries['cold']['synonyms']).to include('chilly')
    end
  end

  describe "#look_up_word" do
    it "looks up the correct word definition" do
      new_dict.add_word('cold', 'lacking of affection or warmth')
      cold_def = new_dict.look_up_word('cold')
      expect(cold_def).to eq('lacking of affection or warmth')
    end

    it "returns nil if given word does not exsist" do
      hot_def = new_dict.look_up_word('hot')
      expect(hot_def).to be_nil
    end
  end
  
  describe "look_up_synonyms" do
    it "looks up the correct synonyms" do
      new_dict.add_word('chilly', 'uncomfortably cool or cold')
      new_dict.add_word('cold', 'lacking of affection or warmth')
      new_dict.add_word('cool', 'of or at fairly low temperature')
      new_dict.add_synonym('cold', 'cool')
      new_dict.add_synonym('cold', 'chilly')
      cold_synonyms = new_dict.look_up_synonyms('cold')
      expect(cold_synonyms).to include('cool', 'chilly')
    end
  end

  # decribe Dictionary class end
end