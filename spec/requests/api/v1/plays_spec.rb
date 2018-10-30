require 'rails_helper'

describe 'API' do
  it 'POST /api/v1/games/1/plays' do
    game = create(:game)

    

    get '/api/v1/games/1'
    initial_game_state = JSON.parse(response.body, symbolize_names: true)

    expect(initial_game_state[:scores].first[:score]).to eq(0)
    expect(initial_game_state[:scores].second[:score]).to eq(0)



    payload = {'user_id': 1, 'word': 'at'}
    post "/api/v1/games/#{game.id}/plays", params: payload

    expect(response.status).to eq(201)

    get '/api/v1/games/1'
    game_state = JSON.parse(response.body, symbolize_names: true)
    expect(game_state[:scores].first[:score]).to eq(2)
    expect(game_state[:scores].second[:score]).to eq(0)
  end
end
