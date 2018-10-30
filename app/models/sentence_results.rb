class SentenceResults

  def initialize(word)
    @word = word
  end

  def word
    @word
  end

  def sentences
    result = service.get_sentences(@word)
    sentences = result[:results].first[:lexicalEntries].first[:sentences]
    filtered = filter_regions(sentences)
    filtered.map do |sentence|
      Sentence.new(sentence)
    end
    binding.pry
  end



  private

  def filter_regions(sentences)
    sentences.select do |sentence|
      sentence[:regions].first == "Canadian" || sentence[:regions].first == "British"
    end
  end

  def service
    @service ||= OxfordService.new()
  end

end
