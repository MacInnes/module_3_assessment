require 'rails_helper'

describe 'API' do
  it 'GET /api/v1/games/:id' do
    create(:play, user_id: 2)
    get '/api/v1/games/1'

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:game_id]).to eq(1)
    expect(json_response[:scores].length).to eq(2)
    expect(json_response[:scores].first[:user_id]).to eq(1)
    expect(json_response[:scores].first[:score]).to eq(0)
    expect(json_response[:scores].second[:user_id]).to eq(2)
    expect(json_response[:scores].second[:score]).to eq(8)
  end
end

# When I send a GET request to “/api/v1/games/1” I receive a JSON response as follows:
#
# ```{
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }```
