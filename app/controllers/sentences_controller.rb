class SentencesController < ApplicationController

  def index
    @sentence = SentenceResults.new(params[:word])
  end

end
