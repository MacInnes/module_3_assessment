class Sentence

  def initialize(sentence_data)
    @text = sentence_data[:text]
    @region = sentence_data[:regions].first
  end

  def text
    @text
  end

  def region
    @region
  end

end
