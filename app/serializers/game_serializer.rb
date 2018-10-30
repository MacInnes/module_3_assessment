class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    user_1 = User.find(object.player_1.id)
    user_2 = User.find(object.player_2.id)
    output_hash = [user_data(user_1), user_data(user_2)]
  end

  private

  def player_score(player)
    plays = Play.where("game_id": object.id, "user_id": player.id)
    plays.inject(0) do |total, play|
      total += play.score
    end
  end

  def user_data(user)
    {
      user_id: user.id,
      score: player_score(user)
    }
  end

end
