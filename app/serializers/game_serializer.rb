class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    user_1 = User.find(object.player_1.id)
    user_2 = User.find(object.player_2.id)
    output_hash = [{
      user_id: user_1.id,
      score: player_score(object, user_1)
    },
    {
      user_id: user_2.id,
      score: player_score(object, user_2)
    }]
  end

  def player_score(game, player)
    plays = Play.where("game_id": game.id, "user_id": player.id)
    plays.inject(0) do |total, play|
      total += play.score
    end
  end

end
