require_relative 'word_counter'

RSpec.describe WordCounter do

  let(:word_counter) {WordCounter.new}

    it "returns an empty hash with default value 0 for an empty string passed" do
      counts = word_counter.count_words("")
      expect(counts).to eq({})
      expect(counts['hi']).to eq(0)
    end

    it "returns an hash with 1 key and value 1 if a string of 1 word is passed" do
      counts = word_counter.count_words("hi")
      expect(counts).to eq({"hi" => 1})
      expect(counts.length).to eq(1)
    end

    it "returns an hash with 1 key with value 2 for a string of 2 same words" do
      expect(word_counter.count_words("hi hi")).to eq({"hi" => 2})
    end

    it "considers multiples spaces as single space" do
      expect(word_counter.count_words("hi  hi")).to eq({"hi" => 2})
    end

    it "converts punctuation into spaces" do
      expect(word_counter.count_words("hi.hi")).to eq({"hi" => 2})
    end

    it "returns an hash with 2 keys of value 1 each for a string of 2 different words" do
      expect(word_counter.count_words("hi world")).to eq({"hi" => 1, "world" => 1})
    end

    it "doesn't differentiate same words if one is capitalised" do
      expect(word_counter.count_words("Hi world hi world")).to eq({"hi" => 2, "world" => 2})
    end

    it "doesn't consider punctuation in the string passed" do
      expect(word_counter.count_words("Hi world, hi: world!")).to eq({"hi" => 2, "world" => 2})
    end

    it "sorts alphabetically the words of the array" do
      counts = word_counter.count_words("Hi, how are you?")
      expect(counts.find_index(["are", 1])).to eq(0)

    end

  end
