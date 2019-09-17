require 'rails_helper'

feature "User view graph links" do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_button('BTC')
    expect(page).to have_button('ETH')
    expect(page).to have_button('Nasdaq')
  end

  scenario 'visit to wiki' do
    visit currency_path("Bitcoin")
    expect(page).to have_link('Bitcoin', :href => "https://en.wikipedia.org/wiki/Bitcoin")
    expect(page).to have_link('Etherium', :href => "https://en.wikipedia.org/wiki/Ethereum")
    expect(page).to have_link('Nasdaq', :href => "https://en.wikipedia.org/wiki/Nasdaq")
  end
end