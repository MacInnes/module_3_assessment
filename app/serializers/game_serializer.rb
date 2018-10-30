class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    user_1 = User.find(object.player_1.id)
    user_2 = User.find(object.player_2.id)
    [user_1.user_data(object), user_2.user_data(object)]
  end

end
