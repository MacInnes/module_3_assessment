FactoryBot.define do
  factory :game do
    association :player_1, factory: :user
    association :player_2, factory: :user
  end
end
