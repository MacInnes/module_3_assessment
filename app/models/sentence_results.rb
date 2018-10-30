class SentenceResults

  def initialize(word)
    @word = word
  end

  def word
    @word
  end

  def sentences
    service.get_sentences(@word)
  end

  private

  def service
    @service ||= OxfordService.new()
  end

end
