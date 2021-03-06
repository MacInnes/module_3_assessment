require 'rails_helper'

feature 'a guest user' do
  scenario 'enters a word on the page' do
    visit '/'
    fill_in :word, with: "mindfulness"
    click_on "Submit"

    stub = File.open('./fixtures/sentences.json')
    stub_request(:get, 'https://od-api.oxforddictionaries.com/api/v1/entries/en/mindfulness/sentences')
        .to_return(body: stub, status: 200)

    expect(page).to have_content("Examples for using 'mindfulness'")
    expect(page).to have_css(".sentences")
    expect(page).to have_content("Region: British")
    expect(page).to have_content("Region: Canadian")
    expect(page).to_not have_content("Region: North American")
  end
end
