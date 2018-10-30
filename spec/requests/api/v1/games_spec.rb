require 'rails_helper'

describe 'API' do
  it 'GET /api/v1/games/:id' do
    create(:game)
    get '/api/v1/games/1'

    binding.pry
    expect(response).to be_valid
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
