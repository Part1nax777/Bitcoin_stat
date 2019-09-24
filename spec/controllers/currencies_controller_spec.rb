require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do

  it 'should display bitcoin charts' do
    should_display_charts('bitcoin')
  end

  it 'should display ethereum charts' do
    should_display_charts('ethereum')
  end

  it 'should display nasdaq charts' do
    should_display_charts('nasdaq')
  end

  private

  def should_display_charts(currency)
    get :show, params: { id: currency }
    expect(response.status).to eq(200)
    expect(response).to render_template(:show)
    expect(response).to be_success
  end
end
