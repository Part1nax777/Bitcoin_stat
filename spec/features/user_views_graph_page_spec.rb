require 'rails_helper'

feature "User view graph links" do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_link('Bitcoin')
    expect(page).to have_link('Ethereum')
    expect(page).to have_link('Nasdaq')
  end

  scenario 'visit to wiki' do
    visit currency_path("Bitcoin")
    expect(page).to have_link('Bitcoin', :href => "https://en.wikipedia.org/wiki/Bitcoin")
    visit currency_path("Ethereum")
    expect(page).to have_link('Ethereum', :href => "https://en.wikipedia.org/wiki/Ethereum")
    visit currency_path("Nasdaq")
    expect(page).to have_link('Nasdaq', :href => "https://en.wikipedia.org/wiki/Nasdaq")
  end
end