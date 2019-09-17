require 'rails_helper'

feature "User view homepage" do
  scenario "successfully" do
    visit root_path
    expect(page).to have_content("Values of CryptoCurrencies")
  end
end