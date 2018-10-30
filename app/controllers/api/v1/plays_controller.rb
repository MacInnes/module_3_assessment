class Api::V1::PlaysController < ActionController::API

  def create
    play = Play.new(game_id: params[:game_id], user_id: params[:user_id], word: params[:word])
    if play.save
      render json: '',  status: 201
    end
  end
end
