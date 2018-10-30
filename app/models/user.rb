class User < ApplicationRecord
  has_many :plays

  def user_data(game)
    {
      user_id: self.id,
      score: player_score(game)
    }
  end

  private

  def player_score(game)
    plays = Play.where("game_id": game.id, "user_id": self.id)
    plays.inject(0) do |total, play|
      total += play.score
    end
  end

end
